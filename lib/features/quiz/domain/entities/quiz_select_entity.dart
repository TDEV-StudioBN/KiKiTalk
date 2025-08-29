import 'package:kikitalk/features/quiz/domain/entities/quiz_entity.dart';

class ENTQuizSelect extends ENTQuiz<List<String>, List<String>> {
  final bool isSequential;
  ENTQuizSelect({
    required super.id,
    required super.question,
    required super.options,
    required super.correctAnswer,
    super.userAnswer,
    required this.isSequential,
  });

  @override
  bool check(List<String> userAnswer) {
    if(userAnswer.length != correctAnswer.length) return false;

    if(!isSequential) {
      for (final answer in userAnswer) {
        if (!correctAnswer.contains(answer)) return false;
      }
    }
    else {
      for (int i = 0; i < userAnswer.length; i++) {
        if (userAnswer[i] != correctAnswer[i]) return false;
      }
    }
    return true;
  }
}