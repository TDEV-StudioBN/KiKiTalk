import 'package:kikitalk/core/models_interface/task_interface.dart';

class ENTTask extends ITask {
  ENTTask({
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

  bool get isCompleted => progress == total;

  @override
  String toString() {
    return 'ENTTask(id: $id, key: $key, title: $title, description: $description, progress: $progress, total: $total, rewardGold: $rewardGold, rewardDiamond: $rewardDiamond)';
  }
}