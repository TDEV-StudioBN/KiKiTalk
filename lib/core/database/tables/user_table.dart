import 'package:kikitalk/core/database/tables/app_table.dart';

class UserTable extends AppTable {
  static const instance = UserTable._();
  const UserTable._();

  @override
  String get name => 'user';

  final String columnEmail = 'email';
  final String columnName = 'name';
  final String columnAvatar = 'avatar';

  @override
  String get build => '''
    CREATE TABLE IF NOT EXISTS $name (
      $columnEmail TEXT PRIMARY KEY,
      $columnName TEXT NOT NULL,
      $columnAvatar TEXT NOT NULL
    );
  ''';
}