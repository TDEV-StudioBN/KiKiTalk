import 'package:server/src/config/server_config.dart';
import 'package:server/src/database/database.dart';
import 'package:server/src/database/tables/app_tables.dart';
import 'package:server/src/database/tables/cumulativepoint_table.dart';
import 'package:server/src/dtos/cumulativepoint.dart';
import 'package:server/src/entities/cumulativepoint.dart';
import 'package:server/src/utils/id_generate_util.dart';

CumulativePointTable get _table => TableSchemas.cumulativePoint;

sealed class CumulativeRespository {
  Stream<CumulativePointEntity> watchOne(String userEmail);
  Future<CumulativePointEntity> getOne(String userEmail);
  Future<void> create(CumulativePointEntity entity);
  Future<void> update(CumulativePointEntity entity);
}

class CumulativeRespositoryImpl extends CumulativeRespository {
  final IDatabase db = ServerConfig.database;

  @override
  Stream<CumulativePointEntity> watchOne(String userEmail) async* {
    final result = await db.selectOne(
        table: _table.name,
        whereClause: '${_table.columnUserEmail} = ?',
        whereArgs: [userEmail]
    );
    if(result == null) {
      final newCumulativePoint = CumulativePointEntity(
          id: IDUtil.randomV4(),
          userEmail: userEmail,
          diamond: 0,
          gold: 0,
          rankPoints: 0,
          streakDays: 1
      );
      create(newCumulativePoint);
      yield newCumulativePoint;
    } else {
      yield CumulativePointDTO.fromJson(result).toEntity();
    }

    yield* db.changes.where((change) =>
        change.table == _table.name &&
        change.data![_table.columnUserEmail] == userEmail)
        .map((change) => CumulativePointDTO.fromJson(change.data!).toEntity());
  }

  @override
  Future<CumulativePointEntity> getOne(String userEmail) async {
    final result = await db.selectOne(
        table: _table.name,
        whereClause: '${_table.columnUserEmail} = ?',
        whereArgs: [userEmail]
    );
    if(result == null) {
      final newCumulativePoint = CumulativePointEntity(
          id: IDUtil.randomV4(),
          userEmail: userEmail,
          diamond: 0,
          gold: 0,
          rankPoints: 0,
          streakDays: 1
      );
      create(newCumulativePoint);
      return newCumulativePoint;
    }
    return CumulativePointDTO.fromJson(result).toEntity();
  }

  @override
  Future<void> create(CumulativePointEntity entity) async {
    final data = CumulativePointDTO.fromEntity(entity).toJson();
    await db.upsert(
        table: _table.name,
        data: data,
    );
  }

  @override
  Future<void> update(CumulativePointEntity entity) async {
    final data = CumulativePointDTO.fromEntity(entity).toJson();
    await db.update(
        table: _table.name,
        data: data,
        whereClause: '${_table.columnId} = ?',
        whereArgs: [entity.id]
    );
  }
}