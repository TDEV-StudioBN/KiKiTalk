import 'package:kikitalk/core/models_interface/vocabulary_interface.dart';

class ENTVocabulary extends IVocabulary {
  ENTVocabulary({
    required super.id,
    required super.word,
    required super.meanings,
    required super.examples,
    super.isLearned = false,
    super.practiceCount = 0,
    super.lastReviewedAt,
    super.proficiencyScore = 0,
    super.phonetic,
    super.partOfSpeech,
    super.language,
    super.level,
  });
}