import 'package:server/src/database/tables/app_table.dart';
import 'package:server/src/database/tables/user_table.dart';

class TaskTable extends TableSchema {
  static const instance = TaskTable._();
  const TaskTable._();

  @override
  String get name => 'task';
  final String columnId = 'id';
  final String columnUserEmail = 'userEmail';
  final String columnKey = 'key';
  final String columnTitle = 'title';
  final String columnDescription = 'description';
  final String columnProgress = 'progress';
  final String columnTotal = 'total';
  final String columnRewardGold = 'rewardGold';
  final String columnRewardDiamond = 'rewardDiamond';
  final String columnIsRewardGiven = 'isRewardGiven';

  @override
  String get build => '''
    CREATE TABLE IF NOT EXISTS $name (
      $columnId TEXT PRIMARY KEY,
      $columnUserEmail TEXT NOT NULL,
      
      $columnKey TEXT NOT NULL,
      $columnTitle TEXT NOT NULL,
      $columnDescription TEXT NOT NULL,
      
      $columnProgress REAL NOT NULL,
      $columnTotal REAL NOT NULL,
      
      $columnRewardGold INTEGER NOT NULL,
      $columnRewardDiamond INTEGER NOT NULL,
      $columnIsRewardGiven INTEGER NOT NULL,
      
      FOREIGN KEY ($columnUserEmail) REFERENCES ${UserTable.instance.name}(${UserTable.instance.columnEmail}) ON DELETE CASCADE
    );
  ''';
}
