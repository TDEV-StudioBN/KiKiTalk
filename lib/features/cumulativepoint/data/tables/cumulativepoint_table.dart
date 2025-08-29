class CumulativePointTable {
  static get instance => const CumulativePointTable._();
  const CumulativePointTable._();

  String get columnId => 'id';
  String get columnUserEmail => 'userEmail';
  String get columnDiamond => 'diamond';
  String get columnGold => 'gold';
  String get columnRankPoints => 'rankPoints';
  String get columnStreakDays => 'streakDays';
}
