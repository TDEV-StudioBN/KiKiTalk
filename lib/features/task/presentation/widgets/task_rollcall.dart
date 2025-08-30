import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kikitalk/app/style/appstyle.dart';
import 'package:kikitalk/app/style/style.dart';
import 'package:kikitalk/app/ui/widgets/buttons.dart';
import 'package:kikitalk/core/di.dart';
import 'package:kikitalk/features/task/domain/entities/task_entity.dart';
import 'package:kikitalk/features/task/presentation/states/taskrollcall_cubit/cubit.dart';
import 'package:kikitalk/features/task/presentation/states/taskrollcall_cubit/state.dart';
import 'package:kikitalk/screen/extension.dart';

class WIDTaskRollCall extends StatelessWidget {
  const WIDTaskRollCall({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskRollCallCubit(getIt(), getIt())..getAll(context.userEmail),
      child: const _TaskRollCallWidget(),
    );
  }
}

class _TaskRollCallWidget extends StatelessWidget {
  const _TaskRollCallWidget();
  List<String> get days => ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskRollCallCubit, TaskRollCallState>(
      builder: (context, state) {
        final tasks = state.tasks;
        final today = DateTime.now().weekday;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Điểm danh', style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSize.textTitle)),
            Row(
            children: List.generate(7, (index) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    children: [
                      Text(days[index], style: const TextStyle(fontSize: AppSize.small2, fontWeight: FontWeight.w900)),
                      _ItemRollCall(
                        task: index < tasks.length ? tasks[index] : null,
                        index: index + 1,
                        today: today,
                      ),
                    ],
                  )
                ),
              );
            }),
            )
          ],
        );
      },
    );
  }
}

/// Item điểm danh  ------------------------------------------------------------
class _ItemRollCall extends StatelessWidget {
  final ENTTask? task;
  final int index;
  final int today;

  const _ItemRollCall({this.task, required this.index, required this.today});

  bool get _isClaimed => task?.isRewardGiven == true;
  bool get _isCompleted => task?.isCompleted == true;
  bool get _isPast => index < today;
  bool get _isFuture => index > today;

  @override
  Widget build(BuildContext context) {
    final alpha = AppColor.alphaCoefficient;
    final color = context.style.color.secondary.withValues(
      alpha: alpha - alpha*(today > index ? 1 : today == index ? 0 : (index - today)*alpha/2),
    );

    // Chưa nhận => hiển thị ?  ------------------------------------------------
    if ((task == null || _isPast && !_isCompleted) || (!_isClaimed && (_isFuture || index == today))) {
      return _buildBox(
        context: context,
        color: color,
        isCanRollCall: index == today,
        child: const Text(
          "?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSize.small2),
        ),
      );
    }

    // Đã nhận => hiển thị phần thưởng  ----------------------------------------
    return _buildBox(
      context: context,
      color: color,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(task!.rewardGold > 0)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.monetization_on_outlined, color: Colors.yellow, size: AppSize.small2),
              Text('${task!.rewardGold}',
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: AppSize.small2)),
            ],
          ),

          if(task!.rewardDiamond > 0)
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.diamond_outlined, color: Colors.lightBlueAccent, size: AppSize.small2),
              Text('${task!.rewardDiamond}',
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: AppSize.small2)),
            ],
          ),
        ],
      ),
    );
  }

  /// build item  --------------------------------------------------------------
  Widget _buildBox({required BuildContext context, required Color color, required Widget child, bool isCanRollCall = false}) {
    return WIDButton(
        onTap: () {
          if(isCanRollCall) {
            context.read<TaskRollCallCubit>().rollCall(context.userEmail, task!.id);
          }
        },
        borderRadius: BorderRadius.circular(12),
        bulging: isCanRollCall ? 4 : 1,
        color: color,
        child: Container(
          alignment: Alignment.center,
          height: 30,
          child: child,
        )
    );
  }
}
