/*import 'package:server/server.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}*/

import 'package:server/src/config/server_config.dart';
import 'package:server/src/entities/task.dart';
import 'package:server/src/services/task.dart';
import 'package:server/src/utils/log_util.dart';

void main() async {
  await ServerConfig.database.init();
  ITaskService service = TaskServiceImpl();
  final List<TaskEntity> tasks = await service.getTasksRollCall('emaila');
  for(var task in tasks) {
    logSuccess(task);
    print('\n');
  }
  final claim = await service.rollCall('emaila', tasks[5].id);
  if(claim) {
    logSuccess('Thành công');
  }
  else {
    logError('Thất bại');
  }
}