import 'package:server/src/database/tables/app_tables.dart';
import 'package:server/src/entities/task.dart';

get _table => TableSchemas.task;

class TaskDTO extends TaskEntity {
  TaskDTO({
    required super.id,
    required super.userEmail,
    required super.key,
    required super.title,
    required super.description,
    required super.progress,
    required super.total,
    required super.rewardGold,
    required super.rewardDiamond,
    required super.isRewardGiven
  });

  Map<String, dynamic> toJson() {
    return {
      _table.columnId: id,
      _table.columnUserEmail: userEmail,
      _table.columnKey: key,
      _table.columnTitle: title,
      _table.columnDescription: description,
      _table.columnProgress: progress,
      _table.columnTotal: total,
      _table.columnRewardGold: rewardGold,
      _table.columnRewardDiamond: rewardDiamond,
      _table.columnIsRewardGiven: isRewardGiven ? 1 : 0,
    };
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      userEmail: userEmail,
      key: key,
      title: title,
      description: description,
      progress: progress,
      total: total,
      rewardGold: rewardGold,
      rewardDiamond: rewardDiamond,
      isRewardGiven: isRewardGiven,
    );
  }

  factory TaskDTO.fromJson(Map<String, dynamic> json) {
    return TaskDTO(
      id: json[_table.columnId] as String,
      userEmail: json[_table.columnUserEmail] as String,
      key: json[_table.columnKey] as String,
      title: json[_table.columnTitle] as String,
      description: json[_table.columnDescription] as String,
      progress: json[_table.columnProgress] as double,
      total: json[_table.columnTotal] as double,
      rewardGold: json[_table.columnRewardGold] as int,
      rewardDiamond: json[_table.columnRewardDiamond] as int,
      isRewardGiven: (json[_table.columnIsRewardGiven] as int) == 0 ? false : true,
    );
  }

  factory TaskDTO.fromEntity(TaskEntity entity) {
    return TaskDTO(
      id: entity.id,
      userEmail: entity.userEmail,
      key: entity.key,
      title: entity.title,
      description: entity.description,
      progress: entity.progress,
      total: entity.total,
      rewardGold: entity.rewardGold,
      rewardDiamond: entity.rewardDiamond,
      isRewardGiven: entity.isRewardGiven,
    );
  }
}