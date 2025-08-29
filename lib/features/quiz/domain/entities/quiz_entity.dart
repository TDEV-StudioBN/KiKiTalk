import 'package:kikitalk/core/models_interface/quiz_interface.dart';

abstract class ENTQuiz<TypeOptions, TypeAnswerCorrect> extends IQuiz<TypeOptions, TypeAnswerCorrect> {
  ENTQuiz({
    required super.id,
    required super.question,
    required super.options,
    required super.correctAnswer,
    super.userAnswer,
  });

  bool check(TypeAnswerCorrect userAnswer);
}