class QuizTable {
  static const instance = QuizTable._();
  const QuizTable._();

  final String columnId = 'id';
  final String columnUserEmail = 'userEmail';
  final String columnQuizzes = 'quizzes';
}
