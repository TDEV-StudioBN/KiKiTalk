import 'package:flutter/cupertino.dart';
import 'package:kikitalk/core/di.dart';

class AppWidget {
  static final instance = AppWidget._internal();
  AppWidget._internal();

  ICumulativePointWidget get cumulativePoint => getIt();
}

abstract class ICumulativePointWidget {
  Widget info();
}