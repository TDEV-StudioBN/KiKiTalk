import 'package:flutter/material.dart';
import 'package:kikitalk/app/style/appstyle.dart';
import 'package:kikitalk/screen/presentation/widgets/mainpages_widget/homepage_widget.dart';
import 'package:kikitalk/screen/presentation/widgets/mainpages_widget/settingspage_widget.dart';

class SCRMain extends StatelessWidget {
  const SCRMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MainScreen();
  }
}

class _MainScreen extends StatefulWidget {
  const _MainScreen();

  @override
  State<_MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
          children: [
            const Expanded(child: TabBarView(
              children: [
                WIDHomePage(),
                WIDSettingsPage(),
              ],
            )),

            SafeArea(child: Container(
              width: 300,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 2,
                    color: context.style.color.primary,
                  )
              ),
              child: TabBar(
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                indicatorColor: context.style.color.primary,
                labelColor: context.style.color.primary,
                tabs: const [
                  Tab(icon: Icon(Icons.home_outlined, size: 30)),
                  Tab(icon: Icon(Icons.settings_outlined, size: 30)),
                ],
              ),
            ))
          ],
      ),
    );

  }
}