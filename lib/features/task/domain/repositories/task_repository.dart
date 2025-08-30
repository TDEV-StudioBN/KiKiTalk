import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/features/task/domain/entities/task_entity.dart';

abstract class REPTask {
  Future<Result<List<ENTTask>>> getTasksRollCall({required String email});
  Future<Result<bool>> claimReward({required String email, required String taskId});
  Future<Result<bool>> rollCall({required String email, required String taskId});
}