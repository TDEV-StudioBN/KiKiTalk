import 'package:kikitalk/core/models_interface/cumulativepoint_interface.dart';

class ENTCumulativePoint extends ICumulativePoint {
  ENTCumulativePoint({
    required super.id,
    required super.userEmail,
    required super.diamond,
    required super.gold,
    required super.rankPoints,
    required super.streakDays,
  });

  @override
  String toString() {
    return 'ENTCumulativePoint(id: $id, userEmail: $userEmail, diamond: $diamond, gold: $gold, rankPoints: $rankPoints, streakDays: $streakDays)';
  }
}