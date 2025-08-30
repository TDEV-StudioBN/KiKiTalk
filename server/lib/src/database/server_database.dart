import 'dart:async';
import 'package:server/src/database/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:server/src/database/tables/app_tables.dart';
import 'package:server/src/utils/log_util.dart';

class ClientDatabase extends IDatabase<Database> {
  static final ClientDatabase instance = ClientDatabase._internal();
  ClientDatabase._internal();

  @override
  Future<void> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, name);

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        for(final table in TableSchemas.all) {
          logInfo('Creating table ${table.name}');
          await db.execute(table.build);
        }
      },
    );

    changeController = StreamController<DbChange>.broadcast();
  }

  @override
  Future<void> close() async {
    await db.close();
    changeController?.close();
  }

  @override
  Future<void> update({
    required String table,
    required Map<String, Object?> data,
    required String whereClause,
    required List<Object?> whereArgs,
  }) async {
    await db.update(
      table,
      data,
      where: whereClause,
      whereArgs: whereArgs,
    );

    if (streamMode) {
      changeController?.add(DbChange(
        type: ChangeType.update,
        table: table,
        data: data,
        where: whereClause,
        args: whereArgs,
      ));
    }
  }

  @override
  Future<void> upsert({
    required String table,
    required Map<String, Object?> data,
    List<String>? updateColumns,
    String conflictColumn = 'id',
  }) async {
    final columns = data.keys.join(', ');
    final placeholders = List.filled(data.length, '?').join(', ');

    String sql = 'INSERT INTO $table ($columns) VALUES ($placeholders)';

    if (updateColumns != null && updateColumns.isNotEmpty) {
      final updates = updateColumns.map((c) => '$c = ?').join(', ');
      sql += ' ON CONFLICT($conflictColumn) DO UPDATE SET $updates';
    }

    final values = [
      ...data.values,
      ...?updateColumns?.map((c) => data[c]),
    ];

    await db.rawInsert(sql, values);

    if (streamMode) {
      changeController?.add(DbChange(
        type: ChangeType.upsert,
        table: table,
        data: data,
      ));
    }
  }

  @override
  Future<void> delete({
    required String table,
    required String whereClause,
    required List<Object?> whereArgs,
  }) async {
    await db.delete(
      table,
      where: whereClause,
      whereArgs: whereArgs,
    );

    if (streamMode) {
      changeController?.add(DbChange(
        type: ChangeType.delete,
        table: table,
        where: whereClause,
        args: whereArgs,
      ));
    }
  }

  @override
  Future<List<Map<String, Object?>>> selectMany({
    required String table,
    String? whereClause,
    List<Object?>? whereArgs,
  }) async {
    return db.query(
      table,
      where: whereClause,
      whereArgs: whereArgs,
    );
  }

  @override
  Future<Map<String, Object?>?> selectOne({
    required String table,
    required String whereClause,
    required List<Object?> whereArgs,
  }) async {
    final result = await db.query(
      table,
      where: whereClause,
      whereArgs: whereArgs,
    );

    if (result.isEmpty) return null;
    return result.first;
  }

  @override
  Future<bool> upsertBatch({
    required String table,
    required List<Map<String, Object?>> dataList,
    List<String>? updateColumns,
    String conflictColumn = 'id',
  }) async {
    if (dataList.isEmpty) return true;

    final batch = db.batch();

    for (final data in dataList) {
      batch.insert(
        table,
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    try {
      await batch.commit(noResult: true);
      return true;
    } catch (e, st) {
      logError('upsertBatch failed: $e\n$st');
      return false;
    }
  }

}
