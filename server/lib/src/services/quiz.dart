import 'package:server/src/entities/cumulativepoint.dart';
import 'package:server/src/entities/quiz.dart';
import 'package:server/src/repositories/cumulativepoint.dart';
import 'package:server/src/repositories/skills.dart';

sealed class IQuizService {
  Future<void> onQuizCompleted(QuizResultEntity entity);
}

class QuizServiceImpl implements IQuizService {

  @override
  Future<void> onQuizCompleted(QuizResultEntity entity) async {

    //- Tính tiền
    final cumulativePointRepository = CumulativeRespositoryImpl();
    final cumulativePoint = await cumulativePointRepository.getOne(entity.userEmail);
    CumulativePointEntity cumulativePointUpdated;

    double coefficient = entity.correct / entity.total - entity.incorrect / entity.total;
    int score = (10 * coefficient).ceil().clamp(0, 10);
    double money = 5 + (score / 10) * 20;
    cumulativePointUpdated = cumulativePoint.copyWith(
      gold: cumulativePoint.gold + money.toInt(),
    );

    if(coefficient > 0.9) {
      cumulativePointUpdated = cumulativePointUpdated.copyWith(
        diamond: cumulativePoint.diamond + 1,
      );
    }

    cumulativePointRepository.update(cumulativePointUpdated);

    //- Tính skill
    final skillsRepository = SkillsRepositoryImpl();
    var skills = await skillsRepository.getSkills(entity.userEmail);

    int safeDiv(int correct, int incorrect) => incorrect == 0 ? correct : correct ~/ incorrect;

    if (entity.readingCorrect > 0) {
      skills = skills.copyWith(
        reading: skills.reading + safeDiv(entity.readingCorrect, entity.readingInCorrect),
      );
    }
    if (entity.listeningCorrect > 0) {
      skills = skills.copyWith(
        listening: skills.listening + safeDiv(entity.listeningCorrect, entity.listeningInCorrect),
      );
    }
    if (entity.speakingCorrect > 0) {
      skills = skills.copyWith(
        speaking: skills.speaking + safeDiv(entity.speakingCorrect, entity.speakingInCorrect),
      );
    }
    if (entity.writingCorrect > 0) {
      skills = skills.copyWith(
        writing: skills.writing + safeDiv(entity.writingCorrect, entity.writingInCorrect),
      );
    }

    skillsRepository.updateSkills(skills);
  }
}