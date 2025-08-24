
class ENTCumulativePoint {
  final int id;
  final String userEmail;
  final int diamond;
  final int gold;
  final int rankPoints;
  final int streakDays;

  ENTCumulativePoint({
    required this.id,
    required this.userEmail,
    required this.diamond,
    required this.gold,
    required this.rankPoints,
    required this.streakDays,
  });

  @override
  String toString() {
    return 'ENTCumulativePoint(id: $id, userEmail: $userEmail, diamond: $diamond, gold: $gold, rankPoints: $rankPoints, streakDays: $streakDays)';
  }
}