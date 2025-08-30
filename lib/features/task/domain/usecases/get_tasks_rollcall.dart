import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/core/usecase/usecase.dart';
import 'package:kikitalk/features/task/domain/entities/task_entity.dart';
import 'package:kikitalk/features/task/domain/repositories/task_repository.dart';

class UCEGetTaskRollCall extends UseCase<List<ENTTask>, String> {
  final REPTask _repository;
  UCEGetTaskRollCall(this._repository);

  @override
  Future<Result<List<ENTTask>>> call(String params) {
    return _repository.getTasksRollCall(email: params);
  }
}