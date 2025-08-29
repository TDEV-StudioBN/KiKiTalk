class ENTTask {
  final int id;
  final String key;
  final String title;
  final String description;

  final double progress;
  final double total;
  bool get isCompleted => progress >= total;

  final int rewardGold;
  final int rewardDiamond;
  final bool isRewardGiven;

  ENTTask({
    required this.id,
    required this.key,
    required this.title,
    required this.description,
    required this.progress,
    required this.total,
    required this.rewardGold,
    required this.rewardDiamond,
    required this.isRewardGiven,
  });

  @override
  String toString() {
    return 'ENTTask(id: $id, key: $key, title: $title, description: $description, progress: $progress, total: $total, rewardGold: $rewardGold, rewardDiamond: $rewardDiamond)';
  }
}