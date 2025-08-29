import 'package:server/src/database/tables/app_tables.dart';
import 'package:server/src/entities/quiz.dart';

get _table => TableSchemas.quiz;

class QuizSetDTO extends QuizSetEntity {
  QuizSetDTO({
    required super.id,
    required super.userEmail,
    required super.quizzes
  });

  Map<String, dynamic> toJson() {
    return {
      _table.columnId: id,
      _table.columnUserEmail: userEmail,
      _table.columnQuizzes: quizzes,
    };
  }

  QuizSetEntity toEntity() {
    return QuizSetEntity(
      id: id,
      userEmail: userEmail,
      quizzes: quizzes,
    );
  }

  factory QuizSetDTO.fromJson(Map<String, dynamic> json) {
    return QuizSetDTO(
      id: json[_table.columnId] as String,
      userEmail: json[_table.columnUserEmail] as String,
      quizzes: json[_table.columnQuizzes] as String,
    );
  }

  factory QuizSetDTO.fromEntity(QuizSetEntity entity) {
    return QuizSetDTO(
      id: entity.id,
      userEmail: entity.userEmail,
      quizzes: entity.quizzes,
    );
  }
}

class QuizResultDTO extends QuizResultEntity {
  QuizResultDTO({
    required super.id,
    required super.userEmail,
    required super.quizSetId,
    required super.incorrect,
    required super.correct,
    required super.readingCorrect,
    required super.readingInCorrect,
    required super.listeningCorrect,
    required super.listeningInCorrect,
    required super.speakingCorrect,
    required super.speakingInCorrect,
    required super.writingCorrect,
    required super.writingInCorrect
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userEmail': userEmail,
      'quizSetId': quizSetId,
      'incorrect': incorrect,
      'correct': correct,
      'readingCorrect': readingCorrect,
      'readingInCorrect': readingInCorrect,
      'listeningCorrect': listeningCorrect,
      'listeningInCorrect': listeningInCorrect,
      'speakingCorrect': speakingCorrect,
      'speakingInCorrect': speakingInCorrect,
      'writingCorrect': writingCorrect,
      'writingInCorrect': writingInCorrect,
    };
  }

  QuizResultEntity toEntity() {
    return QuizResultEntity(
      id: id,
      userEmail: userEmail,
      quizSetId: quizSetId,
      incorrect: incorrect,
      correct: correct,
      readingCorrect: readingCorrect,
      readingInCorrect: readingInCorrect,
      listeningCorrect: listeningCorrect,
      listeningInCorrect: listeningInCorrect,
      speakingCorrect: speakingCorrect,
      speakingInCorrect: speakingInCorrect,
      writingCorrect: writingCorrect,
      writingInCorrect: writingInCorrect,
    );
  }

  factory QuizResultDTO.fromJson(Map<String, dynamic> json) {
    return QuizResultDTO(
      id: json['id'] as String,
      userEmail: json['userEmail'] as String,
      quizSetId: json['quizSetId'] as String,
      incorrect: json['incorrect'] as int,
      correct: json['correct'] as int,
      readingCorrect: json['readingCorrect'] as int,
      readingInCorrect: json['readingInCorrect'] as int,
      listeningCorrect: json['listeningCorrect'] as int,
      listeningInCorrect: json['listeningInCorrect'] as int,
      speakingCorrect: json['speakingCorrect'] as int,
      speakingInCorrect: json['speakingInCorrect'] as int,
      writingCorrect: json['writingCorrect'] as int,
      writingInCorrect: json['writingInCorrect'] as int,
    );
  }

  factory QuizResultDTO.fromEntity(QuizResultEntity entity) {
    return QuizResultDTO(
      id: entity.id,
      userEmail: entity.userEmail,
      quizSetId: entity.quizSetId,
      incorrect: entity.incorrect,
      correct: entity.correct,
      readingCorrect: entity.readingCorrect,
      readingInCorrect: entity.readingInCorrect,
      listeningCorrect: entity.listeningCorrect,
      listeningInCorrect: entity.listeningInCorrect,
      speakingCorrect: entity.speakingCorrect,
      speakingInCorrect: entity.speakingInCorrect,
      writingCorrect: entity.writingCorrect,
      writingInCorrect: entity.writingInCorrect,
    );
  }
}