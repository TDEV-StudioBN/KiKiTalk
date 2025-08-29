import 'package:server/src/repositories/cumulativepoint.dart';
import 'package:server/src/repositories/task.dart';

sealed class ITaskService {
  Future<void> claimReward(String email, String taskId);
}

class TaskServiceImpl extends ITaskService {
  final _tasksRepository = TaskRepositoryImpl();
  final _cumulativePointRepository = CumulativeRespositoryImpl();

  @override
  Future<void> claimReward(String email, String taskId) async {
    final cumulativePoint = await _cumulativePointRepository.getOne(email);
    final task = await _tasksRepository.getTaskById(taskId);
    if(task != null) {
      if(task.isCompleted && !task.isRewardGiven) {
        final cumulativePointUpdated = cumulativePoint.copyWith(
          diamond: cumulativePoint.diamond + task.rewardDiamond,
          gold: cumulativePoint.gold + task.rewardGold,
        );
        final taskUpdated = task.copyWith(
          isRewardGiven: true,
        );
        _cumulativePointRepository.update(cumulativePointUpdated);
        _tasksRepository.updateTask(taskUpdated);
      }
    }
  }
}