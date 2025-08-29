import 'package:kikitalk/features/quiz/data/models/quiz_model.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_write_entity.dart';

class MODQuizWrite extends ENTQuizWrite implements MODQuiz<dynamic, String> {
  MODQuizWrite({
    required super.id,
    required super.question,
    required super.correctAnswer,
    super.userAnswer,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'correctAnswer': correctAnswer,
      'userAnswer': userAnswer,
    };
  }

  factory MODQuizWrite.fromMap(Map<String, dynamic> map) {
    return MODQuizWrite(
      id: map['id'] as String,
      question: map['question'] as String,
      correctAnswer: map['correctAnswer'] as String,
      userAnswer: map['userAnswer'] as String?,
    );
  }
}