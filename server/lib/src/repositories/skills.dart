import 'package:server/src/config/server_config.dart';
import 'package:server/src/database/tables/app_tables.dart';
import 'package:server/src/database/tables/skills_table.dart';
import 'package:server/src/dtos/skills.dart';
import 'package:server/src/entities/skills.dart';
import 'package:server/src/utils/id_generate_util.dart';

SkillsTable get _table => TableSchemas.skills;

sealed class ISkillsRepository {
  Future<void> updateSkills(SkillsEntity entity);
  Future<void> createSkills(SkillsEntity entity);
  Future<SkillsEntity> getSkills(String userEmail);
}

class SkillsRepositoryImpl extends ISkillsRepository {
  final db = ServerConfig.database;

  @override
  Future<void> updateSkills(SkillsEntity entity) async {
    final data = SkillsDTO.fromEntity(entity).toJson();
    await db.update(
        table: _table.name,
        data: data,
        whereClause: '${_table.columnId} = ?',
        whereArgs: [entity.id]
    );
  }

  @override
  Future<void> createSkills(SkillsEntity entity) async {
    final data = SkillsDTO.fromEntity(entity).toJson();
    await db.upsert(
        table: _table.name,
        data: data,
    );
  }

  @override
  Future<SkillsEntity> getSkills(String userEmail) async {
    final result = await db.selectOne(
        table: _table.name,
        whereClause: '${_table.columnUserEmail} = ?',
        whereArgs: [userEmail]
    );
    if(result == null) {
      final newSkills = SkillsEntity(
          id: IDUtil.randomV4(),
          userEmail: userEmail,
          reading: 0,
          listening: 0,
          writing: 0,
          speaking: 0
      );
      createSkills(newSkills);
      return newSkills;
    } else {
      return SkillsDTO.fromJson(result).toEntity();
    }
  }
}