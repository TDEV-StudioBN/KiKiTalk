import 'package:get_it/get_it.dart';
import 'package:kikitalk/features/task/data/datasources/task_local.dart';
import 'package:kikitalk/features/task/data/repositories/task_repository_impl.dart';
import 'package:kikitalk/features/task/domain/repositories/task_repository.dart';
import 'package:kikitalk/features/task/domain/usecases/claim_reward.dart';
import 'package:kikitalk/features/task/domain/usecases/get_tasks_rollcall.dart';
import 'package:kikitalk/features/task/domain/usecases/rollcall.dart';

void setUpTaskDI(GetIt getIt) {
  //  usecase
  getIt.registerFactory(() => UCETaskRollCall(getIt()));
  getIt.registerFactory(() => UCEGetTaskRollCall(getIt()));
  getIt.registerFactory(() => UCETaskClaimReward(getIt()));

  //  repository
  getIt.registerLazySingleton<REPTask>(() => REPTaskImpl(getIt()));

  //  datasource
  getIt.registerLazySingleton<LDSTask>(() => LDSTaskImpl());
}