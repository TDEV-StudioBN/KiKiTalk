import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kikitalk/app/style/appstyle.dart';
import 'package:kikitalk/app/ui/widgets/scaffold_widget.dart';

class WIDSettingsPage extends StatelessWidget {
  const WIDSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WIDScaffold(
      appBar: WIDAppBar(),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.styleConfig.setDarkTheme();
            },
            child: const Text('Dark Mode'),
          ),

          ElevatedButton(
            onPressed: () {
              context.styleConfig.setLightTheme();
            },
            child: const Text('Light Mode'),
          ),

          ElevatedButton(
            onPressed: () {
              context.styleConfig.setSystemTheme();
            },
            child: const Text('System Mode'),
          ),

          ElevatedButton(
            onPressed: () {
              context.styleConfig.setPrimaryColor(setRandomPrimaryColor());
            },
            child: Text('Đổi primary màu', style: TextStyle(
              color: context.style.color.primary,
            )),
          ),
        ],
      ),
    );
  }
}

Color setRandomPrimaryColor() {
  final random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}