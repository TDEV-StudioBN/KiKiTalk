import 'package:kikitalk/core/di.dart';
import 'package:kikitalk/core/models_interface/quiz_interface.dart';

class AppApi {
  static final instance = AppApi._internal();
  AppApi._internal();

  IQuizApi get quiz => getIt();
}

abstract interface class IQuizApi {
  Future<IQuizSet> generateQuizSet({required List<IQuiz> quizzes});
  IQuiz generateQuizOneChoice({required String question, required Set<String> options, required String correctAnswer});
  IQuiz generateQuizSelect({required String question, required List<String> options, required List<String> correctAnswer, required bool isSequential});
  IQuiz generateQuizSound({required String question, required Set<String> options, required String correctAnswer, required bool isQuestionBoxSound});
  IQuiz generateQuizSpeak({required String question, required String correctAnswer});
  IQuiz generateQuizWrite({required String question, required String correctAnswer});
}