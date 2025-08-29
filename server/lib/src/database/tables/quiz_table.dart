import 'package:server/src/database/tables/app_table.dart';
import 'package:server/src/database/tables/user_table.dart';

class QuizTable extends TableSchema {
  static const instance = QuizTable._();
  const QuizTable._();

  @override
  String get name => 'quizset';
  final String columnId = 'id';
  final String columnUserEmail = 'userEmail';
  final String columnQuizzes = 'quizzes';

  @override
  String get build => '''
    CREATE TABLE IF NOT EXISTS $name (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnUserEmail TEXT NOT NULL UNIQUE,
      $columnQuizzes TEXT NOT NULL,
      FOREIGN KEY ($columnUserEmail) REFERENCES ${UserTable.instance.name}(${UserTable.instance.columnEmail}) ON DELETE CASCADE
    );
  ''';
}
