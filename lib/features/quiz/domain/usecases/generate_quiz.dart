import 'package:kikitalk/core/log/log.dart';
import 'package:kikitalk/core/result/failure.dart';
import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/core/usecase/usecase.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_entity.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_onechoice_entity.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_select_entity.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_sound_entity.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_speak_entity.dart';
import 'package:kikitalk/features/quiz/domain/entities/quiz_write_entity.dart';
import 'package:kikitalk/utils/id_generate_util.dart';

class UCEGenerateQuiz extends UseCase<ENTQuiz, PARGenerateQuiz> {
  @override
  Future<Result<ENTQuiz>> call(PARGenerateQuiz params) async {
    try {
      switch(params) {
        case PARGenerateQuizOneChoice():
          return Success(ENTQuizOneChoice(
            id: UTIGenerateId.randomV4(),
            question: params.question,
            options: params.answers,
            correctAnswer: params.correctAnswer,
          ));
        case PARGenerateQuizSelect():
          return Success(ENTQuizSelect(
            id: UTIGenerateId.randomV4(),
            question: params.question,
            options: params.answers,
            correctAnswer: params.correctAnswer,
            isSequential: params.isSequential,
          ));
        case PARGenerateQuizSpeak():
          return Success(ENTQuizSpeak(
            id: UTIGenerateId.randomV4(),
            question: params.question,
            correctAnswer: params.correctAnswer,
          ));
        case PARGenerateQuizWrite():
          return Success(ENTQuizWrite(
            id: UTIGenerateId.randomV4(),
            question: params.question,
            correctAnswer: params.correctAnswer,
          ));
        case PARGenerateQuizSound():
          return Success(ENTQuizSound(
            id: UTIGenerateId.randomV4(),
            question: params.question,
            options: params.answers,
            correctAnswer: params.correctAnswer,
            isQuestionBoxSound: params.isQuestionBoxSound,
          ));
      }
    } catch (e) {
      logError(e.toString());
      return const Fail(AppFailure());
    }
  }
}

sealed class PARGenerateQuiz {
  final String question;
  PARGenerateQuiz({required this.question});
}

class PARGenerateQuizOneChoice extends PARGenerateQuiz {
  final Set<String> answers;
  final String correctAnswer;
  PARGenerateQuizOneChoice({
    required super.question,
    required this.answers,
    required this.correctAnswer,
  });
}

class PARGenerateQuizSelect extends PARGenerateQuiz {
  final List<String> answers;
  final List<String> correctAnswer;
  final bool isSequential;
  PARGenerateQuizSelect({
    required super.question,
    required this.answers,
    required this.correctAnswer,
    required this.isSequential,
  });
}

class PARGenerateQuizSpeak extends PARGenerateQuiz {
  final String correctAnswer;
  PARGenerateQuizSpeak({
    required super.question,
    required this.correctAnswer,
  });
}

class PARGenerateQuizWrite extends PARGenerateQuiz {
  final String correctAnswer;
  PARGenerateQuizWrite({
    required super.question,
    required this.correctAnswer,
  });
}

class PARGenerateQuizSound extends PARGenerateQuiz {
  final bool isQuestionBoxSound;
  final Set<String> answers;
  final String correctAnswer;
  PARGenerateQuizSound({
    required super.question,
    required this.answers,
    required this.correctAnswer,
    required this.isQuestionBoxSound,
  });
}