import 'package:get_it/get_it.dart';
import 'package:kikitalk/core/app_link/app_widgets.dart';
import 'package:kikitalk/features/cumulativepoint/data/datasources/cumulativepoint_local.dart';
import 'package:kikitalk/features/cumulativepoint/data/repositories/cumulativepoint_repository_impl.dart';
import 'package:kikitalk/features/cumulativepoint/domain/repositories/cumulativepoint_repository.dart';
import 'package:kikitalk/features/cumulativepoint/domain/usecases/cumulativepoint_get_usecase.dart';
import 'package:kikitalk/features/cumulativepoint/link.dart';

void initCumulativePointDI(GetIt getIt) {
  getIt.registerSingleton<ICumulativePointWidget>(CumulativePointWidget());

  //  usecase
  getIt.registerFactory(() => UCECumulativePointWatch(getIt()));

  //  repository
  getIt.registerLazySingleton<REPCumulativePoint>(() => REPCumulativePointImpl(getIt()));

  //  datasource
  getIt.registerLazySingleton<LDSCumulativePoint>(() => LDSCumulativePointImpl());
}