import 'package:flutter/material.dart';
import 'package:kikitalk/app/style/appstyle.dart';
import 'package:kikitalk/core/app_link/applink.dart';
import 'package:kikitalk/app/assets/assets.dart';
import 'package:kikitalk/app/ui/widgets/sprite_widget.dart';
import 'package:kikitalk/features/cumulativepoint/presentation/widgets/cumulativepoint_widget.dart';
import 'package:kikitalk/app/ui/widgets/chat_widget.dart';
import 'package:gif/gif.dart';
import 'package:kikitalk/features/task/presentation/widgets/task_rollcall.dart';

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
              const SizedBox(height: 20),
              const _WIDHelloComponent(),
              const SizedBox(height: 20),
              const SizedBox(
                height: 100,
                child: WIDTaskRollCall(),
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

/// CÁC THÀNH PHẦN  ------------------------------------------------------------
//------------------------------------------------------------------------------
class _WIDHelloComponent extends StatefulWidget {
  const _WIDHelloComponent();

  @override
  createState() => _WIDHelloComponentState();
}

class _WIDHelloComponentState extends State<_WIDHelloComponent> with TickerProviderStateMixin {
  late GifController controller;
  late String image;
  bool kitty = true;

  @override
  void initState() {
    super.initState();
    controller = GifController(vsync: this);
    image = AppAsset.path.images.kiki.hellokitty.hello;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(kitty) {
          setState(() {
            image = AppAsset.path.images.kiki.doraemon.hello;
            kitty = false;
          });
        } else {
          setState(() {
            image = AppAsset.path.images.kiki.hellokitty.hello;
            kitty = true;
          });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Gif(
              image: AssetImage(image),
              fps: 20,
              controller: controller,
              autostart: Autostart.loop,
            ),
          ),
          const SizedBox(width: 10),
          WIDChatBubble(
              isMe: false,
              color: context.style.color.primary,
              child: const Text('Xin chào Đào Như Triệu \nHôm nay bạn có gì không?')
          )
        ],
      ),
    );
  }
}