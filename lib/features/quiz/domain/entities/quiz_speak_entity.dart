import 'package:kikitalk/features/quiz/domain/entities/quiz_entity.dart';

class ENTQuizSpeak extends ENTQuiz<dynamic, String> {
  ENTQuizSpeak({
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