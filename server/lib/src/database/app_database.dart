import 'dart:async';

import 'package:server/src/database/database.dart';
import 'package:server/src/database/tables/app_tables.dart';
import 'package:server/src/utils/log_util.dart';
import 'package:sqlite3/sqlite3.dart';

class VMDatabase extends IDatabase<Database> {
  static final VMDatabase instance = VMDatabase._internal();
  VMDatabase._internal();

  @override
  Future<void> init() async {
    db = sqlite3.open(name);
    for(final table in TableSchemas.all) {
      logInfo('Creating table ${table.name}');
      db.execute(table.build);
    }
  }

  @override
  Future<void> close() async {
    db.dispose();
    if(streamMode) {
      await changeController?.close();
    }
  }

  @override
  Future<void> delete({required String table, required String whereClause, required List<Object?> whereArgs}) async {
    final stmt = db.prepare('DELETE FROM $table WHERE $whereClause');
    stmt.execute(whereArgs);
    stmt.dispose();

    if(streamMode) {
      changeController?.add(DbChange(
        type: ChangeType.delete,
        table: table,
        where: whereClause,
        args: whereArgs,
      ));
    }
  }

  @override
  Future<List<Map<String, Object?>>> selectMany({required String table, String? whereClause, List<Object?>? whereArgs}) async {
    final query = whereClause != null ? 'SELECT * FROM $table WHERE $whereClause' : 'SELECT * FROM $table';
    return db.select(query, whereArgs ?? []);
  }

  @override
  Future<Map<String, Object?>?> selectOne({required String table, required String whereClause, required List<Object?> whereArgs}) async {
    final result = db.select('SELECT * FROM $table WHERE $whereClause', whereArgs);
    if (result.isEmpty) return null;
    return result.first;
  }

  @override
  Future<void> update({required String table, required Map<String, Object?> data, required String whereClause, required List<Object?> whereArgs}) async {
    final setClause = data.keys.map((c) => '$c = ?').join(', ');
    final stmt = db.prepare('UPDATE $table SET $setClause WHERE $whereClause');
    stmt.execute([...data.values, ...whereArgs]);
    stmt.dispose();

    if(streamMode) {
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
  Future<void> upsert({required String table, required Map<String, Object?> data, List<String>? updateColumns, String conflictColumn = 'id',}) async {
    final columns = data.keys.join(', ');
    final placeholders = List.filled(data.length, '?').join(', ');

    String sql = 'INSERT INTO $table ($columns) VALUES ($placeholders)';

    if (updateColumns != null && updateColumns.isNotEmpty) {
      final updates = updateColumns.map((c) => '$c = ?').join(', ');
      sql += ' ON CONFLICT($conflictColumn) DO UPDATE SET $updates';
    }

    final stmt = db.prepare(sql);

    final values = [
      ...data.values,
      ...?updateColumns?.map((c) => data[c]),
    ];

    stmt.execute(values);
    stmt.dispose();

    if(streamMode) {
      changeController?.add(DbChange(
        type: ChangeType.upsert,
        table: table,
        data: data,
      ));
    }
  }

  @override
  Future<bool> upsertBatch({required String table, required List<Map<String, Object?>> dataList, List<String>? updateColumns, String conflictColumn = 'id',}) async {
    if (dataList.isEmpty) return true;

    final columns = dataList.first.keys.toList();
    final placeholders = List.filled(columns.length, '?').join(',');

    String updateClause = '';
    if (updateColumns != null && updateColumns.isNotEmpty) {
      final updates = updateColumns.map((col) => '$col=excluded.$col').join(', ');
      updateClause = 'DO UPDATE SET $updates';
    } else {
      updateClause = 'DO NOTHING';
    }

    final sql = '''
      INSERT INTO $table (${columns.join(',')})
      VALUES ($placeholders)
      ON CONFLICT($conflictColumn) $updateClause
    ''';

    try {
      db.execute('BEGIN');

      final stmt = db.prepare(sql);
      for (final data in dataList) {
        stmt.execute(columns.map((c) => data[c]).toList());
      }
      stmt.dispose();

      db.execute('COMMIT');
      return true;
    } catch (e) {
      logError(e.toString());
      db.execute('ROLLBACK');
      rethrow;
    }
  }

}