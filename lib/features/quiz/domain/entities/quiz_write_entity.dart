import 'package:kikitalk/features/quiz/domain/entities/quiz_entity.dart';

class ENTQuizWrite extends ENTQuiz<dynamic, String> {
  ENTQuizWrite({
    required super.id,
    required super.question,
    required super.correctAnswer,
    super.userAnswer,
  }) : super(options: null);

  @override
  bool check(String userAnswer) {
    return userAnswer.trim().toLowerCase() == correctAnswer.trim().toLowerCase();
  }
}