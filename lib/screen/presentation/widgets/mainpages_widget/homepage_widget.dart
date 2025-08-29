import 'package:flutter/material.dart';
import 'package:kikitalk/app/style/appstyle.dart';
import 'package:kikitalk/core/app_link/applink.dart';
import 'package:kikitalk/app/assets/assets.dart';
import 'package:kikitalk/app/ui/widgets/chat_widget.dart';
import 'package:kikitalk/app/ui/widgets/sprite_widget.dart';
import 'package:kikitalk/features/cumulativepoint/presentation/widgets/cumulativepoint_widget.dart';

class WIDHomePage extends StatelessWidget {
  const WIDHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.style.size.heightScreen / 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.style.color.backgroundPrimary,
                context.style.color.backgroundSecondary,
                Colors.transparent
              ],
            ),
          ),
        ),

        SafeArea(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              appWidget.cumulativePoint.info(),
              const SizedBox(
                height: 150,
                child: _HelloWidget(),
              ),
              WIDSpriteAnimation(
                image: AssetImage(AppAsset.path.images.animation.hellokitty1),
                cols: 7,
                rows: 6,
                frameSize: 72,
                frameDuration: const Duration(milliseconds: 500),
              ),
              const CumulativePointPage()
            ],
          ),
        ))
      ],
    );
  }
}

class _HelloWidget extends StatelessWidget {
  const _HelloWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(AppAsset.path.images.kiki.hellokitty.hello),
        ),

        const SizedBox(width: 10),

        WIDChatBubble(
            isMe: false,
            color: context.style.color.primary,
            child: const Text('Xin chào Đào Như Triệu \nHôm nay bạn có gì không?')
        )
      ],
    );
  }
}
