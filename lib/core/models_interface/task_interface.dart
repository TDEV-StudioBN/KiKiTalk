import 'package:kikitalk/core/models_interface/app_interface.dart';

abstract class ITask extends AppInterFace {
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

  ITask({
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
    super.version
  });
}
