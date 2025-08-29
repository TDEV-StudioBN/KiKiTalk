import 'package:kikitalk/core/app_link/app_apis.dart';
import 'package:kikitalk/core/models_interface/quiz_interface.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_onechoice_entity.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_select_entity.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_sound_entity.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_speak_entity.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_write_entity.dart';
import 'package:kikitalk/features/quiz/domain/entities/quizset_entity.dart';
import 'package:kikitalk/utils/id_generate_util.dart';

class QuizApiImpl implements IQuizApi {
  static final instance = QuizApiImpl._internal();
  QuizApiImpl._internal();

  @override
  IQuiz generateQuizOneChoice({required String question, required Set<String> options, required String correctAnswer}) {
    return ENTQuizOneChoice(
        id: UTIGenerateId.randomV4(),
        question: question,
        options: options,
        correctAnswer: correctAnswer
    );
  }

  @override
  IQuiz generateQuizSelect({required String question, required List<String> options, required List<String> correctAnswer, required bool isSequential}) {
    return ENTQuizSelect(
        id: UTIGenerateId.randomV4(),
        question: question,
        options: options,
        correctAnswer: correctAnswer,
        isSequential: isSequential
    );
  }

  @override
  IQuiz generateQuizSound({required String question, required Set<String> options, required String correctAnswer, required bool isQuestionBoxSound}) {
    return ENTQuizSound(
        id: UTIGenerateId.randomV4(),
        question: question,
        options: options,
        correctAnswer: correctAnswer,
        isQuestionBoxSound: isQuestionBoxSound
    );
  }

  @override
  IQuiz generateQuizSpeak({required String question, required String correctAnswer}) {
    return ENTQuizSpeak(
        id: UTIGenerateId.randomV4(),
        question: question,
        correctAnswer: correctAnswer
    );
  }

  @override
  IQuiz generateQuizWrite({required String question, required String correctAnswer}) {
    return ENTQuizWrite(
        id: UTIGenerateId.randomV4(),
        question: question,
        correctAnswer: correctAnswer
    );
  }

  @override
  Future<IQuizSet> generateQuizSet({required List<IQuiz> quizzes}) {
    return Future.value(ENTQuizSet(id: 'id', userEmail: 'userEmail', quizzes: quizzes));
  }
}