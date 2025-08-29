import 'package:kikitalk/features/quiz/data/tables/quiz_table.dart';
import 'package:kikitalk/features/quiz/domain/entities/quizset_entity.dart';

QuizTable get _table => QuizTable.instance;

class MODQuizSet extends ENTQuizSet {
  MODQuizSet({
    required super.id,
    required super.userEmail,
    required super.quizzes,
  });

  Map<String, dynamic> toMap() {
    return {
      _table.columnId: id,
      _table.columnUserEmail: userEmail,
      _table.columnQuizzes: quizzes,
    };
  }
}