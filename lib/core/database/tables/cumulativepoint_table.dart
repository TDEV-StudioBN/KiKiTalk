import 'package:kikitalk/core/database/tables/app_table.dart';
import 'package:kikitalk/core/database/tables/user_table.dart';

class CumulativePointTable extends AppTable {
  static const instance = CumulativePointTable._();
  const CumulativePointTable._();

  @override
  String get name => 'skills';
  final String columnId = 'id';
  final String columnUserEmail = 'userEmail';
  final String columnDiamond = 'diamond';
  final String columnGold = 'gold';
  final String columnRankPoints = 'rankPoints';
  final String columnStreakDays = 'streakDays';

  @override
  String get build => '''
    CREATE TABLE IF NOT EXISTS $name (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnUserEmail TEXT NOT NULL UNIQUE,
      $columnDiamond INTEGER NOT NULL DEFAULT 0,
      $columnGold INTEGER NOT NULL DEFAULT 0,
      $columnRankPoints INTEGER NOT NULL DEFAULT 0,
      $columnStreakDays INTEGER NOT NULL DEFAULT 0,
      FOREIGN KEY ($columnUserEmail) REFERENCES ${UserTable.instance.name}(${UserTable.instance.columnEmail}) ON DELETE CASCADE
    );
  ''';
}
