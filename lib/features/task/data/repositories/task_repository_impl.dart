import 'package:kikitalk/core/result/failure.dart';
import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/features/task/data/datasources/task_local.dart';
import 'package:kikitalk/features/task/domain/entities/task_entity.dart';
import 'package:kikitalk/features/task/domain/repositories/task_repository.dart';
import 'package:kikitalk/utils/log.dart';

class REPTaskImpl extends REPTask {
  final LDSTask _local;
  REPTaskImpl(this._local);

  @override
  Future<Result<bool>> claimReward({required String email, required String taskId}) async {
    try {
      final result = await _local.claimReward(email: email, taskId: taskId);
      return Result.success(result);
    } catch (e, s) {
      logError(e, stackTrace: s);
      return Result.error(const AppFailure());
    }
  }

  @override
  Future<Result<List<ENTTask>>> getTasksRollCall({required String email}) async {
    try {
      final result = await _local.getTaskRollCall(email: email);
      return Result.success(result);
    } catch (e, s) {
      logError(e, stackTrace: s);
      return Result.error(const AppFailure());
    }
  }

  @override
  Future<Result<bool>> rollCall({required String email, required String taskId}) async {
    try {
      final result = await _local.rollCall(email: email, taskId: taskId);
      return Result.success(result);
    } catch (e, s) {
      logError(e, stackTrace: s);
      return Result.error(const AppFailure());
    }
  }
}