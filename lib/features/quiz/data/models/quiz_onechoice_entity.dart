import 'package:kikitalk/features/quiz/data/models/quiz_model.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_onechoice_entity.dart';

class MODQuizOneChoice extends ENTQuizOneChoice implements MODQuiz<Set<String>, String> {
  MODQuizOneChoice({
    required super.id,
    required super.question,
    required super.options,
    required super.correctAnswer,
    super.userAnswer,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
      'userAnswer': userAnswer,
    };
  }

  factory MODQuizOneChoice.fromMap(Map<String, dynamic> map) {
    return MODQuizOneChoice(
      id: map['id'] as String,
      question: map['question'] as String,
      options: map['options'] as Set<String>,
      correctAnswer: map['correctAnswer'] as String,
      userAnswer: map['userAnswer'] as String?,
    );
  }
}