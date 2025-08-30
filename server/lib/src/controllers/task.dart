import 'package:server/src/controllers/apis.dart';
import 'package:server/src/controllers/response.dart';
import 'package:server/src/dtos/task.dart';
import 'package:server/src/entities/task.dart';
import 'package:server/src/services/task.dart';
import 'package:server/src/utils/log_util.dart';

sealed class ITaskController extends APIController {
  /// Nhận thưởng
  /// ```
  /// String userEmail
  /// String taskId
  /// ```
  /// `value:` [bool]
  IFutureResponse claimReward(Map<String, Object?> request);

  /// Điểm danh
  /// `value:` [bool]
  IFutureResponse rollCall({required String email, required String taskId});

  /// Lấy danh sách điểm danh
  /// `tasks:` [List] - [TaskEntity]
  IFutureResponse getTasksRollCall({required String email});
}

class TaskControllerImpl extends ITaskController {
  final _tasksService = TaskServiceImpl();

  @override
  FutureResponse claimReward(Map<String, Object?> request) {
    try {
      try {
        final String emailRaw = request['userEmail'] as String;
        final String taskIdRaw = request['taskId'] as String;
        return FutureResponse(_tasksService
            .claimReward(emailRaw, taskIdRaw)
            .then((value) => Success200({'value': value}))
        );
      }
      catch(e) {
        return FutureResponse.value(BadRequest400());
      }
    }
    catch(e, s) {
      logError(e, stackTrace: s);
      return FutureResponse.value(InternalServerError500());
    }
  }

  @override
  FutureResponse getTasksRollCall({required String email}) {
    try {
      return FutureResponse(
        _tasksService.getTasksRollCall(email)
            .then((value) => Success200({
              'tasks' : value.map((task) => TaskDTO.fromEntity(task).toJson()).toList()
            })
        )
      );
    }
    catch(e, s) {
      logError(e, stackTrace: s);
      return FutureResponse.value(InternalServerError500());
    }
  }

  @override
  FutureResponse rollCall({required String email, required String taskId}) {
    try {
      return FutureResponse(
        _tasksService.rollCall(email, taskId)
            .then((value) => Success200({'value': value}))
      );
    }
    catch(e, s) {
      logError(e, stackTrace: s);
      return FutureResponse.value(InternalServerError500());
    }
  }
}