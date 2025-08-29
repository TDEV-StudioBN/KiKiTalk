import 'package:kikitalk/features/quiz/data/models/quiz_model.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_speak_entity.dart';

class MODQuizSpeak extends ENTQuizSpeak implements MODQuiz<dynamic, String> {
  MODQuizSpeak({
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

  factory MODQuizSpeak.fromMap(Map<String, dynamic> map) {
    return MODQuizSpeak(
      id: map['id'] as String,
      question: map['question'] as String,
      correctAnswer: map['correctAnswer'] as String,
      userAnswer: map['userAnswer'] as String?,
    );
  }
}