class TaskTable {
  static const instance = TaskTable._();
  const TaskTable._();

  final String columnId = 'id';
  final String columnUserEmail = 'userEmail';
  final String columnKey = 'key';
  final String columnTitle = 'title';
  final String columnDescription = 'description';
  final String columnProgress = 'progress';
  final String columnTotal = 'total';
  final String columnRewardGold = 'rewardGold';
  final String columnRewardDiamond = 'rewardDiamond';
  final String columnIsRewardGiven = 'isRewardGiven';
}
