
import 'package:kikitalk/core/database/tables/cumulativepoint_table.dart';
import 'package:kikitalk/features/cumulativepoint/domain/entities/cumulativepoint_entity.dart';

CumulativePointTable get _table => CumulativePointTable.instance;

class MODCumulativePoint extends ENTCumulativePoint {
  MODCumulativePoint({
    required super.id,
    required super.userEmail,
    required super.diamond,
    required super.gold,
    required super.rankPoints,
    required super.streakDays
  });

  Map<String, dynamic> toMap() {
    return {
      _table.columnId: id,
      _table.columnUserEmail: userEmail,
      _table.columnDiamond: diamond,
      _table.columnGold: gold,
      _table.columnRankPoints: rankPoints,
      _table.columnStreakDays: streakDays,
    };
  }

  factory MODCumulativePoint.fromMap(Map<String, dynamic> map) {
    return MODCumulativePoint(
      id: map[_table.columnId] as int,
      userEmail: map[_table.columnUserEmail] as String,
      diamond: map[_table.columnDiamond] as int,
      gold: map[_table.columnGold] as int,
      rankPoints: map[_table.columnRankPoints] as int,
      streakDays: map[_table.columnStreakDays] as int,
    );
  }
}