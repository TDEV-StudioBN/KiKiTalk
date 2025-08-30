import 'package:server/src/config/server_config.dart';
import 'package:server/src/database/tables/app_tables.dart';
import 'package:server/src/database/tables/task_table.dart';
import 'package:server/src/dtos/task.dart';
import 'package:server/src/entities/task.dart';

TaskTable get _table => TableSchemas.task;

abstract class ITaskRepository {
  Future<List<TaskEntity>> getTasks(String userEmail);
  Future<TaskEntity?> getTaskById(String taskId);
  Future<List<TaskEntity>> getTaskByKey(String userEmail, String key);
  Future<void> updateTask(TaskEntity entity);
  Future<void> createTask(TaskEntity entity);
  Future<void> createTasks(List<TaskEntity> entities);
  Future<void> deleteByEmail(String email);
  Future<void> deleteByEmailAndKey(String email, String key);
}

class TaskRepositoryImpl extends ITaskRepository {
  final db = ServerConfig.database;

  @override
  Future<List<TaskEntity>> getTasks(String userEmail) async {
    final result = await db.selectMany(
        table: _table.name,
        whereClause: '${_table.columnUserEmail} = ?',
        whereArgs: [userEmail]
    );
    return result.map((e) => TaskDTO.fromJson(e).toEntity()).toList();
  }

  @override
  Future<TaskEntity?> getTaskById(String taskId) async {
    final result = await db.selectOne(
        table: _table.name,
        whereClause: '${_table.columnId} = ?',
        whereArgs: [taskId]
    );
    if(result == null) {
      return null;
    } else {
      return TaskDTO.fromJson(result).toEntity();
    }
  }

  @override
  Future<List<TaskEntity>> getTaskByKey(String userEmail, String key) async {
    final result = await db.selectMany(
        table: _table.name,
        whereClause: '${_table.columnUserEmail} = ? AND ${_table.columnKey} = ?',
        whereArgs: [userEmail, key]
    );
    return result.map((e) => TaskDTO.fromJson(e).toEntity()).toList();
  }

  @override
  Future<void> updateTask(TaskEntity entity) async {
    final data = TaskDTO.fromEntity(entity).toJson();
    await db.update(
        table: _table.name,
        data: data,
        whereClause: '${_table.columnId} = ?',
        whereArgs: [entity.id]
    );
  }

  @override
  Future<void> createTask(TaskEntity entity) async {
    final data = TaskDTO.fromEntity(entity).toJson();
    await db.upsert(
        table: _table.name,
        data: data,
        updateColumns: []
    );
  }

  @override
  Future<void> deleteByEmail(String email) async {
    await db.delete(
        table: _table.name,
        whereClause: '${_table.columnUserEmail} = ?',
        whereArgs: [email]
    );
  }

  @override
  Future<void> deleteByEmailAndKey(String email, String key) async {
    await db.delete(
        table: _table.name,
        whereClause: '${_table.columnUserEmail} = ? AND ${_table.columnKey} = ?',
        whereArgs: [email, key]
    );
  }

  @override
  Future<void> createTasks(List<TaskEntity> entities) async {
    final data = entities.map((e) => TaskDTO.fromEntity(e).toJson()).toList();
    await db.upsertBatch(
        table: _table.name,
        dataList: data,
    );
  }
}