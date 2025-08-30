import 'package:server/src/controllers/apis.dart';
import 'package:server/src/controllers/response.dart';
import 'package:server/src/dtos/quiz.dart';
import 'package:server/src/entities/quiz.dart';
import 'package:server/src/services/quiz.dart';
import 'package:server/src/utils/log_util.dart';

sealed class IQuizController extends APIController {
  /// Tham số
  /// [request] :
  /// {
  ///       id: json['id'] as String,
  ///       userEmail: json['userEmail'] as String,
  ///       quizSetId: json['quizSetId'] as String,
  ///       incorrect: json['incorrect'] as int,
  ///       correct: json['correct'] as int,
  ///       readingCorrect: json['readingCorrect'] as int,
  ///       readingInCorrect: json['readingInCorrect'] as int,
  ///       listeningCorrect: json['listeningCorrect'] as int,
  ///       listeningInCorrect: json['listeningInCorrect'] as int,
  ///       speakingCorrect: json['speakingCorrect'] as int,
  ///       speakingInCorrect: json['speakingInCorrect'] as int,
  ///       writingCorrect: json['writingCorrect'] as int,
  ///       writingInCorrect: json['writingInCorrect'] as int,
  /// }
  IFutureResponse completedQuiz(Map<String, Object?> request);
}

class QuizControllerImpl extends IQuizController {
  final _quizService = QuizServiceImpl();

  @override
  IFutureResponse completedQuiz(Map<String, Object?> request) {
    try {
      QuizResultEntity quizResultEntity;
      try {
        quizResultEntity = QuizResultDTO.fromJson(request).toEntity();
      }
      catch (e) {
        return FutureResponse.value(BadRequest400());
      }
      _quizService.onQuizCompleted(quizResultEntity);
      return FutureResponse.value(Success200({}));
    }
    catch (e, s) {
      logError(e.toString(), stackTrace: s);
      return FutureResponse.value(InternalServerError500());
    }
  }
}