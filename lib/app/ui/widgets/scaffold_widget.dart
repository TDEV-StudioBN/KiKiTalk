import 'package:flutter/material.dart';
import 'package:kikitalk/app/style/appstyle.dart';

class WIDScaffold extends StatelessWidget {
  final WIDAppBar? appBar;
  final Widget? body;
  const WIDScaffold({
    this.appBar,
    this.body,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: body,
    );
  }
}

class WIDAppBar extends AppBar {
  WIDAppBar({
    super.key,
    super.title,
    super.leading,
    super.automaticallyImplyLeading = true,
    super.actions,
    super.bottom,
    super.elevation,
    super.scrolledUnderElevation,
    super.notificationPredicate = defaultScrollNotificationPredicate,
    super.shadowColor,
    super.surfaceTintColor,
    super.shape,
    super.foregroundColor,
    super.iconTheme,
    super.actionsIconTheme,
    super.primary = true,
    super.centerTitle,
    super.excludeHeaderSemantics = false,
    super.titleSpacing,
    super.toolbarOpacity = 1.0,
    super.bottomOpacity = 1.0,
    super.toolbarHeight,
    super.leadingWidth,
    super.toolbarTextStyle,
    super.titleTextStyle,
    super.forceMaterialTransparency = false,
    super.clipBehavior,
    super.actionsPadding,
    super.systemOverlayStyle,
  })
      : super(
    flexibleSpace: Builder(
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                context.style.color.statusBar,
                context.style.color.statusBar.withValues(alpha: 0.1),
                Colors.transparent,
              ],
            ),
          ),
        );
      },
    ),
  );
}
