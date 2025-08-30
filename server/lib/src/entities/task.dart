class TaskEntity {
  final String id;
  final String userEmail;
  final String key;
  final String title;
  final String description;
  final double progress;
  final double total;
  final int rewardGold;
  final int rewardDiamond;
  final bool isRewardGiven;

  TaskEntity({
    required this.id,
    required this.userEmail,
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
    return 'TaskEntity('
        ' id: $id,'
        ' userEmail: $userEmail,'
        ' key: $key,'
        ' title: $title,'
        ' description: $description,'
        ' progress: $progress, '
        ' total: $total,'
        ' rewardGold: $rewardGold,'
        ' rewardDiamond: $rewardDiamond,'
        ' isRewardGiven: $isRewardGiven)';
  }

  TaskEntity copyWith({
    String? key,
    String? title,
    String? description,
    double? progress,
    double? total,
    int? rewardGold,
    int? rewardDiamond,
    bool? isRewardGiven
  }) {
    return TaskEntity(
      id: id,
      userEmail: userEmail,
      key: key ?? this.key,
      title: title ?? this.title,
      description: description ?? this.description,
      progress: progress ?? this.progress,
      total: total ?? this.total,
      rewardGold: rewardGold ?? this.rewardGold,
      rewardDiamond: rewardDiamond ?? this.rewardDiamond,
      isRewardGiven: isRewardGiven ?? this.isRewardGiven,
    );
  }

  bool get isCompleted => progress >= total;
}