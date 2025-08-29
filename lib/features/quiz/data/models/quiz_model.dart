import 'package:kikitalk/features/quiz/domain/entities/quiz_entity.dart';

abstract class MODQuiz<TypeAnswers, TypeAnswerCorrect> extends ENTQuiz<TypeAnswers, TypeAnswerCorrect> {
  MODQuiz({
    required super.id,
    required super.question,
    required super.options,
    required super.correctAnswer,
    super.userAnswer,
  });

  Map<String, dynamic> toMap();
}