import 'package:flutter/material.dart';
import 'package:kikitalk/app/style/appstyle.dart';
import 'package:kikitalk/screen/presentation/screens/kikitalk_screen.dart';
import 'app/app_init.dart';

void main() async {
  await initApp();
  runApp(const AppScreen());
}

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppThemeProvider(
      builder: (context, theme) {
        return  MaterialApp(
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
            title: 'KiKiTalk',
            theme: theme.light,
            darkTheme: theme.dark,
            themeMode: theme.mode,
            home: const Material(
                child: SCRKikiTalk()
            )
        );
      }
    );
  }
}