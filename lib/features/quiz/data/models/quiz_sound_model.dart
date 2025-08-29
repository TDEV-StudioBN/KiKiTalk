import 'package:kikitalk/features/quiz/data/models/quiz_model.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_sound_entity.dart';

class MODQuizSound extends ENTQuizSound implements MODQuiz<Set<String>, String> {
  MODQuizSound({
    required super.id,
    required super.question,
    required super.options,
    required super.correctAnswer,
    required super.isQuestionBoxSound
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
      'isQuestionBoxSound': isQuestionBoxSound,
    };
  }

  factory MODQuizSound.fromMap(Map<String, dynamic> map) {
    return MODQuizSound(
      id: map['id'] as String,
      question: map['question'] as String,
      options: map['options'] as Set<String>,
      correctAnswer: map['correctAnswer'] as String,
      isQuestionBoxSound: map['isQuestionBoxSound'] as bool,
    );
  }
}