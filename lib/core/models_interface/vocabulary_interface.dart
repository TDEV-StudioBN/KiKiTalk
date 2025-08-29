import 'package:kikitalk/core/models_interface/app_interface.dart';

abstract class IVocabularySet extends AppInterFace {
  final String id;
  final String userEmail;
  final List<IVocabulary> vocabularies;

  IVocabularySet({
    required this.id,
    required this.userEmail,
    required this.vocabularies,
    super.version
  });
}

abstract class IVocabulary extends AppInterFace {

  //  Các thuộc tính cơ bản ----------------------------------------------------

  /// Định danh
  final String id;

  /// Từ gốc (ví dụ: "apple")
  final String word;

  /// Danh sách nghĩa của từ (có thể nhiều nghĩa)
  final Set<String> meanings;

  /// Ví dụ sử dụng từ trong câu
  final List<String> examples;

  /// User đã đánh dấu là đã học từ này chưa
  final bool isLearned;

  /// Số lần đã luyện tập từ này
  final int practiceCount;

  /// Lần ôn tập gần nhất
  final DateTime? lastReviewedAt;

  /// Điểm thành thạo (0 = chưa biết, 100 = thành thạo)
  final double proficiencyScore;

  //  Các thuộc tính phụ  ------------------------------------------------------

  /// Ảnh mô tả
  final String? image;

  /// Phiên âm quốc tế (ví dụ: /ˈæp.l̩/)
  final String? phonetic;

  /// Loại từ (noun, verb, adj...)
  final String? partOfSpeech;

  /// Ngôn ngữ của từ (EN, VI, JP...)
  final String? language;

  /// Cấp độ khó (A1, A2, B1, TOEIC...)
  final String? level;

  IVocabulary({
    required this.id,
    required this.word,
    required this.meanings,
    required this.examples,
    this.isLearned = false,
    this.practiceCount = 0,
    this.lastReviewedAt,
    this.proficiencyScore = 0,

    this.image,
    this.phonetic,
    this.partOfSpeech,
    this.language,
    this.level,
  });
}
