import 'package:kikitalk/core/models_interface/app_interface.dart';

abstract class IQuizSet extends AppInterFace {
  final String id;
  final String userEmail;
  final List<IQuiz> quizzes;

  IQuizSet({
    required this.id,
    required this.userEmail,
    required this.quizzes,
    super.version
  });
}

abstract class IQuiz<TypeOptions, TypeCorrectAnswer> extends AppInterFace {
  final String id;
  final String question;
  final TypeOptions options;
  final TypeCorrectAnswer correctAnswer;
  final TypeCorrectAnswer? userAnswer;

  IQuiz({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.userAnswer,
  });
}