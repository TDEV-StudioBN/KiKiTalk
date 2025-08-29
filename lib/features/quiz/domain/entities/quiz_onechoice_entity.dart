import 'package:kikitalk/features/quiz/domain/entities/quiz_entity.dart';

class ENTQuizOneChoice extends ENTQuiz<Set<String>, String> {
  ENTQuizOneChoice({
    required super.id,
    required super.question,
    required super.options,
    required super.correctAnswer,
    super.userAnswer,
  });

  @override
  bool check(String userAnswer) {
    return userAnswer == correctAnswer;
  }
}