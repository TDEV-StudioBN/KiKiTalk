import 'package:server/src/config/server_config.dart';
import 'package:server/src/database/tables/app_tables.dart';
import 'package:server/src/database/tables/user_table.dart';
import 'package:server/src/dtos/user.dart';
import 'package:server/src/entities/user.dart';
import 'package:server/src/utils/log_util.dart';

UserTable get _table => TableSchemas.user;

sealed class IUserRepository {
  Future<bool> login(UserEntity entity);
  Future<UserEntity?> getUser(String userEmail);
}

class UserRepositoryImpl extends IUserRepository {
  final db = ServerConfig.database;

  @override
  Future<UserEntity?> getUser(String userEmail) async {
    final result = await db.selectOne(
        table: _table.name,
        whereClause: '${_table.columnEmail} = ?',
        whereArgs: [userEmail]
    );
    if(result == null) {
      return null;
    }
    else {
      return UserDTO.fromJson(result).toEntity();
    }
  }

  @override
  Future<bool> login(UserEntity entity) async {
    try {
      await db.upsert(
          table: _table.name,
          data: UserDTO.fromEntity(entity).toJson(),
      );
      return true;
    }
    catch (e, s) {
      logError(e.toString(), stackTrace: s);
      return false;
    }
  }
}