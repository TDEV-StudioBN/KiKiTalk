import 'package:server/src/config/server_config.dart';
import 'package:server/src/controllers/cumulativepoint.dart';
import 'package:server/src/controllers/quiz.dart';
import 'package:server/src/controllers/response.dart';
import 'package:server/src/controllers/task.dart';
import 'package:server/src/database/server_database.dart';

class APICall {
  Future<Map<String, dynamic>> call(IFutureResponse reponse) async {
    return await (reponse as FutureResponse).futureJson();
  }
}

class APIStream {
  Stream<Map<String, dynamic>> call(IStreamResponse response) {
    return (response as StreamResponse).streamJson();
  }
}

class APIs {
  ICumulativePointController get cumulativePoint => CumulativePointControllerImpl();
  IQuizController get quiz => QuizControllerImpl();
  ITaskController get task => TaskControllerImpl();
}

class Server {
  static Future<void> init() async {
    ServerConfig.database = ClientDatabase.instance;
    await ServerConfig.database.init();
    ServerConfig.database.setEnableStream();
  }
}