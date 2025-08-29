import 'package:kikitalk/features/quiz/data/models/quiz_model.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_select_entity.dart';

class MODQuizSelect extends ENTQuizSelect implements MODQuiz<List<String>, List<String>> {
  MODQuizSelect({
    required super.id,
    required super.question,
    required super.options,
    required super.correctAnswer,
    super.userAnswer,
    required super.isSequential,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
      'userAnswer': userAnswer,
      'isSequential': isSequential,
    };
  }

  factory MODQuizSelect.fromMap(Map<String, dynamic> map) {
    return MODQuizSelect(
      id: map['id'] as String,
      question: map['question'] as String,
      options: map['options'] as List<String>,
      correctAnswer: map['correctAnswer'] as List<String>,
      userAnswer: map['userAnswer'] as List<String>?,
      isSequential: map['isSequential'] as bool,
    );
  }
}