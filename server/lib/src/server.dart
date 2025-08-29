import 'package:server/src/config/server_config.dart';
import 'package:server/src/controllers/cumulativepoint.dart';
import 'package:server/src/controllers/quiz.dart';
import 'package:server/src/controllers/response.dart';

class APICall {
  Future<Map<String, dynamic>> call(Response reponse) async {
    return reponse.toJson();
  }
}

class APIStream {
  Stream<Map<String, dynamic>> call(StreamResponse response) {
    return response.toStream();
  }
}

class APIs {
  ICumulativePointController get cumulativePoint => CumulativePointControllerImpl();
  IQuizController get quiz => QuizControllerImpl();
}

class Server {
  static Future<void> init() async {
    ServerConfig.isRunOnClient = true;
    await ServerConfig.database.init();
    ServerConfig.database.setEnableStream();
  }
}