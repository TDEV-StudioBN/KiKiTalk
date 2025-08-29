import 'package:server/src/config/server_config.dart';
import 'package:server/src/database/tables/app_tables.dart';
import 'package:server/src/database/tables/quiz_table.dart';

QuizTable get _table => TableSchemas.quiz;

class QuizRepository {
  final db = ServerConfig.database;
}