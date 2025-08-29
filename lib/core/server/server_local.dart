import 'package:server/server.dart';

class ServerLocal {
  static final ServerLocal instance = ServerLocal._();
  ServerLocal._();

  APICall get call => APICall();
  APIStream get stream => APIStream();
  APIs get apis => APIs();
}