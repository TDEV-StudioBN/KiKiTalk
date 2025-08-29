import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:kikitalk/core/di.dart';
import 'package:kikitalk/utils/shared_preferences_util.dart';
import 'package:server/server.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupDI();
  await UTISharedPreferences.init();
  await Server.init();
}