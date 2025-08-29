import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kikitalk/app/style/appstyle.dart';
import 'package:kikitalk/core/di.dart';
import 'package:kikitalk/core/server/server_local.dart';
import 'package:kikitalk/app/ui/widgets/buttons.dart';
import 'package:kikitalk/features/cumulativepoint/presentation/states/cumulativepoint_cubit.dart';
import 'package:kikitalk/screen/presentation/states/auth_bloc/auth_bloc.dart';
import 'package:kikitalk/screen/presentation/states/auth_bloc/auth_event.dart';
import 'package:kikitalk/screen/presentation/states/auth_bloc/auth_state.dart';

class WIDCumulativePoint extends StatelessWidget {
  const WIDCumulativePoint({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = CumulativePointCubit(getIt());
        cubit.start((context.read<AuthBloc>().state as STAAuthSuccess).email);
        return cubit;
      },
      child: const _CumulativePointWidget(),
    );
  }
}

class _CumulativePointWidget extends StatefulWidget {
  const _CumulativePointWidget();

  @override
  State<StatefulWidget> createState() => _CumulativePointState();
}

class _CumulativePointState extends  State<_CumulativePointWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CumulativePointCubit, CumulativePointState>(
        builder: (context, state) {
          final data = state.data;
          int diamond = 0;
          int gold = 0;
          int streak = 0;

          if(data != null) {
            diamond = data.diamond;
            gold = data.gold;
            streak = data.streakDays;
          }

          return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _items([
                  _Item(icon: Icons.whatshot, iconColor: Colors.orange, value: streak)
                ]),

                const SizedBox(width: 16),

                _items([
                  _Item(icon: Icons.diamond, iconColor: Colors.blue, value: diamond),
                  _Item(icon: Icons.monetization_on, iconColor: Colors.yellow, value: gold),
                ])
              ]
          );
        });
  }

  Widget _items(List<_Item> items) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: context.style.color.cardColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < items.length; i++) ...[
                items[i],
                if (i < items.length - 1) const SizedBox(width: 8),
              ]
            ]
        ),
    );
  }
}

class _Item extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final int value;
  const _Item({
    required this.icon,
    required this.iconColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 4),
        Text('$value', style: const TextStyle(
            fontWeight: FontWeight.w900
        ),),
      ],
    );
  }
}

class CumulativePointPage extends StatelessWidget {
  const CumulativePointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = CumulativePointCubit(getIt());
        cubit.start((context.read<AuthBloc>().state as STAAuthSuccess).email);
        return cubit;
      },
      child: const _CumulativePointView(),
    );
  }
}

class _CumulativePointView extends StatelessWidget {
  const _CumulativePointView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CumulativePointCubit, CumulativePointState>(
      builder: (context, state) {
        if (state.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null) {
          return Center(child: Text('Lỗi: ${state.error}'));
        }

        final point = state.data;
        if (point == null) {
          return const Center(child: Text('Không có dữ liệu'));
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User: ${point.userEmail}'),
            Text('Gold: ${point.gold}'),
            Text('Diamond: ${point.diamond}'),
            Text('Rank Points: ${point.rankPoints}'),
            Text('Streak Days: ${point.streakDays}'),

            WIDButton(
                onTap: () {
                  ServerLocal.instance.call(
                    ServerLocal.instance.apis.quiz.completedQuiz({
                      'id': '1',
                      'userEmail': (context.read<AuthBloc>().state as STAAuthSuccess).email,
                      'quizSetId': '1',
                      'incorrect': 0,
                      'correct': 12,
                      'readingCorrect': 1,
                      'readingInCorrect': 1,
                      'listeningCorrect': 1,
                      'listeningInCorrect': 1,
                      'speakingCorrect': 1,
                      'speakingInCorrect': 1,
                      'writingCorrect': 1,
                      'writingInCorrect': 1,
                    })
                  );
                },
                color: context.style.color.primary,
                borderRadius: BorderRadius.circular(12),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: const Text('OnClick')
            ),

            WIDButton(
                onTap: () {
                  context.read<AuthBloc>().add(EVESingout());
                },
                color: context.style.color.secondary,
                borderRadius: BorderRadius.circular(16),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: const Text('Đăng xuất')
            )
          ],
        );
      },
    );
  }
}
