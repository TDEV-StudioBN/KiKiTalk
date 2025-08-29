import 'package:server/src/database/tables/app_tables.dart';
import 'package:server/src/entities/cumulativepoint.dart';

get _table => TableSchemas.cumulativePoint;

class CumulativePointDTO extends CumulativePointEntity {
  CumulativePointDTO({
    required super.id,
    required super.userEmail,
    required super.diamond,
    required super.gold,
    required super.rankPoints,
    required super.streakDays
  });

  Map<String, dynamic> toJson() {
    return {
      _table.columnId: id,
      _table.columnUserEmail: userEmail,
      _table.columnDiamond: diamond,
      _table.columnGold: gold,
      _table.columnRankPoints: rankPoints,
      _table.columnStreakDays: streakDays,
    };
  }

  CumulativePointEntity toEntity() {
    return CumulativePointEntity(
      id: id,
      userEmail: userEmail,
      diamond: diamond,
      gold: gold,
      rankPoints: rankPoints,
      streakDays: streakDays,
    );
  }

  factory CumulativePointDTO.fromJson(Map<String, dynamic> json) {
    return CumulativePointDTO(
      id: json[_table.columnId] as String,
      userEmail: json[_table.columnUserEmail] as String,
      diamond: json[_table.columnDiamond] as int,
      gold: json[_table.columnGold] as int,
      rankPoints: json[_table.columnRankPoints] as int,
      streakDays: json[_table.columnStreakDays] as int,
    );
  }

  factory CumulativePointDTO.fromEntity(CumulativePointEntity entity) {
    return CumulativePointDTO(
      id: entity.id,
      userEmail: entity.userEmail,
      diamond: entity.diamond,
      gold: entity.gold,
      rankPoints: entity.rankPoints,
      streakDays: entity.streakDays,
    );
  }
}