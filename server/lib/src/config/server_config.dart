import 'package:server/src/database/app_database.dart';
import 'package:server/src/database/database.dart';

class ServerConfig {
  static IDatabase database = VMDatabase.instance;
}