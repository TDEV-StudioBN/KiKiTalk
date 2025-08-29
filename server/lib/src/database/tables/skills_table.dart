import 'package:server/src/database/tables/app_table.dart';
import 'package:server/src/database/tables/user_table.dart';

class SkillsTable extends TableSchema {
  static const instance = SkillsTable._();
  const SkillsTable._();

  @override
  String get name => 'skills';
  final String columnId = 'id';
  final String columnUserEmail = 'userEmail';
  final String columnReading = 'reading';
  final String columnListening = 'listening';
  final String columnWriting = 'writing';
  final String columnSpeaking = 'speaking';

  @override
  String get build => '''
    CREATE TABLE IF NOT EXISTS $name (
      $columnId TEXT PRIMARY KEY,
      $columnUserEmail TEXT NOT NULL UNIQUE,
      $columnReading REAL NOT NULL,
      $columnListening REAL NOT NULL,
      $columnWriting REAL NOT NULL,
      $columnSpeaking REAL NOT NULL,
      FOREIGN KEY ($columnUserEmail) REFERENCES ${UserTable.instance.name}(${UserTable.instance.columnEmail}) ON DELETE CASCADE
    );
  ''';
}
