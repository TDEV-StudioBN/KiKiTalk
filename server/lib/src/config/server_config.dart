import 'package:server/src/database/app_database.dart';
import 'package:server/src/database/database.dart';
import 'package:server/src/database/server_database.dart';

class ServerConfig {
  static bool isRunOnClient = false;

  static IDatabase get database => isRunOnClient ? ClientDatabase.instance : VMDatabase.instance;
}