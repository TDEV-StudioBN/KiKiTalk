class CumulativePointEntity {
  final String id;
  final String userEmail;
  final int diamond;
  final int gold;
  final int rankPoints;
  final int streakDays;

  CumulativePointEntity({
    required this.id,
    required this.userEmail,
    required this.diamond,
    required this.gold,
    required this.rankPoints,
    required this.streakDays,
  });

  CumulativePointEntity copyWith({
    int? diamond,
    int? gold,
    int? rankPoints,
    int? streakDays,
  }) {
    return CumulativePointEntity(
      id: id,
      userEmail: userEmail,
      diamond: diamond ?? this.diamond,
      gold: gold ?? this.gold,
      rankPoints: rankPoints ?? this.rankPoints,
      streakDays: streakDays ?? this.streakDays,
    );
  }

  bool canPayWithGold(int gold) {
    return this.gold >= gold;
  }

  bool canPayWithDiamond(int diamond) {
    return this.diamond >= diamond;
  }
}