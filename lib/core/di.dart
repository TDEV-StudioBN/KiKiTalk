import 'package:get_it/get_it.dart';
import 'package:kikitalk/features/cumulativepoint/di.dart';
import 'package:kikitalk/features/task/di.dart';
import 'package:kikitalk/screen/di.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  setUpAuthDI(getIt);
  initCumulativePointDI(getIt);
  setUpTaskDI(getIt);
}
