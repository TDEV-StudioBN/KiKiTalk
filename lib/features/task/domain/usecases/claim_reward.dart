import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/core/usecase/usecase.dart';
import 'package:kikitalk/features/task/domain/repositories/task_repository.dart';

class UCETaskClaimReward extends UseCase<bool, TaskClaimRewardParams> {
  final REPTask _repository;
  UCETaskClaimReward(this._repository);

  @override
  Future<Result<bool>> call(TaskClaimRewardParams params) {
    return _repository.claimReward(email: params.email, taskId: params.taskId);
  }
}

class TaskClaimRewardParams {
  final String email;
  final String taskId;
  TaskClaimRewardParams({
    required this.email,
    required this.taskId,
  });
}