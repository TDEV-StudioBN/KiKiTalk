import 'package:kikitalk/features/quiz/domain/entities/quiz_entity.dart';

class ENTQuizSound extends ENTQuiz<Set<String>, String> {
  final bool isQuestionBoxSound;

  ENTQuizSound({
    required super.id,
    required super.question,
    required super.options,
    required super.correctAnswer,
    super.userAnswer,
    required this.isQuestionBoxSound,
  });

  @override
  bool check(String userAnswer) {
    return userAnswer == correctAnswer;
  }
}