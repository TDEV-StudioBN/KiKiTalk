import 'package:kikitalk/features/task/data/tables/task_table.dart';
import 'package:kikitalk/features/task/domain/entities/task_entity.dart';

TaskTable get _table => TaskTable.instance;

class MODTask extends ENTTask {
  MODTask({
    required super.id,
    required super.key,
    required super.title,
    required super.description,

    required super.progress,
    required super.total,

    required super.rewardGold,
    required super.rewardDiamond,
    required super.isRewardGiven,
  });

  Map<String, dynamic> toMap() {
    return {
      _table.columnId: id,
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

  factory MODTask.fromMap(Map<String, dynamic> map) {
    return MODTask(
      id: map[_table.columnId] as int,
      key: map[_table.columnKey] as String,
      title: map[_table.columnTitle] as String,
      description: map[_table.columnDescription] as String,
      progress: map[_table.columnProgress] as double,
      total: map[_table.columnTotal] as double,
      rewardGold: map[_table.columnRewardGold] as int,
      rewardDiamond: map[_table.columnRewardDiamond] as int,
      isRewardGiven: map[_table.columnIsRewardGiven] == 1,
    );
  }

  factory MODTask.fromEntity(ENTTask entity) {
    return MODTask(
      id: entity.id,
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