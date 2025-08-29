import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Material(
      child: Test(),
    ),
  ));
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Test());
  }
}