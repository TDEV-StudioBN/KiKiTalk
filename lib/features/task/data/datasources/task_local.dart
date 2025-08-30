import 'package:kikitalk/core/server/server_local.dart';
import 'package:kikitalk/features/task/data/models/task_model.dart';

sealed class LDSTask {
  Future<List<MODTask>> getTaskRollCall({required String email});
  Future<bool> claimReward({required String email, required String taskId});
  Future<bool> rollCall({required String email, required String taskId});
}

class LDSTaskImpl extends LDSTask {
  ServerLocal get _server => ServerLocal.instance;

  @override
  Future<bool> claimReward({required String email, required String taskId}) async {
    final response = await _server.call(
      _server.apis.task.claimReward({'userEmail': email, 'taskId': taskId}),
    );
    if (response['status'] == 200 && response['data'] != null) {
      return response['data']['value'];
    } else {
      throw Exception(response['error'] ?? 'Unknown error');
    }
  }

  @override
  Future<List<MODTask>> getTaskRollCall({required String email}) async {
    final response = await _server.call(
      _server.apis.task.getTasksRollCall(email: email),
    );
    if (response['status'] == 200 && response['data'] != null) {
      return (response['data']['tasks'] as List<dynamic>)
          .map((task) => MODTask.fromMap(task))
          .toList();
    } else {
      throw Exception(response['error'] ?? 'Unknown error');
    }
  }

  @override
  Future<bool> rollCall({required String email, required String taskId}) async {
    final response = await _server.call(
      _server.apis.task.rollCall(email: email, taskId: taskId),
    );
    if (response['status'] == 200 && response['data'] != null) {
      return response['data']['value'];
    } else {
      throw Exception(response['error'] ?? 'Unknown error');
    }
  }
}