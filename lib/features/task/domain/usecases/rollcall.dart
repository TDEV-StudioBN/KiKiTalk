import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/core/usecase/usecase.dart';
import 'package:kikitalk/features/task/domain/repositories/task_repository.dart';

class UCETaskRollCall extends UseCase<bool, TaskRollCallParams> {
  final REPTask _repository;
  UCETaskRollCall(this._repository);

  @override
  Future<Result<bool>> call(TaskRollCallParams params) {
    return _repository.rollCall(email: params.email, taskId: params.taskId);
  }
}

class TaskRollCallParams {
  final String email;
  final String taskId;
  TaskRollCallParams({
    required this.email,
    required this.taskId,
  });
}