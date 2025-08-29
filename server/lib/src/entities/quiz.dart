
class QuizSetEntity {
  final String id;
  final String userEmail;
  final String quizzes;

  QuizSetEntity({
    required this.id,
    required this.userEmail,
    required this.quizzes
  });

  QuizSetEntity copyWith({
    String? quizzes,
  }) {
    return QuizSetEntity(
      id: id,
      userEmail: userEmail,
      quizzes: quizzes ?? this.quizzes,
    );
  }
}

class QuizResultEntity {
  final String id;
  final String userEmail;
  final String quizSetId;

  final int incorrect;
  final int correct;

  final int readingCorrect;
  final int readingInCorrect;

  final int listeningCorrect;
  final int listeningInCorrect;

  final int speakingCorrect;
  final int speakingInCorrect;

  final int writingCorrect;
  final int writingInCorrect;

  QuizResultEntity({
    required this.id,
    required this.userEmail,
    required this.quizSetId,
    required this.incorrect,
    required this.correct,
    required this.readingCorrect,
    required this.readingInCorrect,
    required this.listeningCorrect,
    required this.listeningInCorrect,
    required this.speakingCorrect,
    required this.speakingInCorrect,
    required this.writingCorrect,
    required this.writingInCorrect,
  });

  int get total => incorrect + correct;
}
