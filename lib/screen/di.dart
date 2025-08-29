import 'package:get_it/get_it.dart';
import 'package:kikitalk/screen/data/datasources/local.dart';
import 'package:kikitalk/screen/data/repositories/auth_repository_impl.dart';
import 'package:kikitalk/screen/domain/repositories/auth_repository.dart';
import 'package:kikitalk/screen/domain/usecase/auth.dart';
import 'package:kikitalk/screen/domain/usecase/get_auth.dart';
import 'package:kikitalk/screen/domain/usecase/singout.dart';

setUpAuthDI(GetIt getIt) {
  /// usecase
  getIt.registerFactory(() => UCEAuth(getIt()));
  getIt.registerFactory(() => UCESingout(getIt()));
  getIt.registerFactory(() => UCEGetAuth(getIt()));

  /// repository
  getIt.registerLazySingleton<REPAuth>(() => REPAuthImpl(getIt()));

  /// datasource
  getIt.registerLazySingleton<LDSAuth>(() => LDSAuthImpl());
}