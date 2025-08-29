import 'package:kikitalk/core/models_interface/app_interface.dart';

abstract class ICumulativePoint extends AppInterFace {
  final String id;
  final String userEmail;
  final int diamond;
  final int gold;
  final int rankPoints;
  final int streakDays;

  ICumulativePoint({
    required this.id,
    required this.userEmail,
    required this.diamond,
    required this.gold,
    required this.rankPoints,
    required this.streakDays,
    super.version,
  });
}