import 'package:server/src/database/tables/app_table.dart';
import 'package:server/src/database/tables/cumulativepoint_table.dart';
import 'package:server/src/database/tables/quiz_table.dart';
import 'package:server/src/database/tables/skills_table.dart';
import 'package:server/src/database/tables/task_table.dart';
import 'package:server/src/database/tables/user_table.dart';

class TableSchemas {
  static get cumulativePoint => CumulativePointTable.instance;
  static get quiz => QuizTable.instance;
  static get skills => SkillsTable.instance;
  static get task => TaskTable.instance;
  static get user => UserTable.instance;

  static List<TableSchema> get all => [
    cumulativePoint,
    quiz,
    skills,
    task,
    user
  ];
}