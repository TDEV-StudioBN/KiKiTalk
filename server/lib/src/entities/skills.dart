class SkillsEntity {
  final String id;
  final String userEmail;
  final double reading;
  final double listening;
  final double writing;
  final double speaking;

  SkillsEntity({
    required this.id,
    required this.userEmail,
    required this.reading,
    required this.listening,
    required this.writing,
    required this.speaking,
  });

  SkillsEntity copyWith({
    double? reading,
    double? listening,
    double? writing,
    double? speaking,
  }) {
    return SkillsEntity(
      id: id,
      userEmail: userEmail,
      reading: reading ?? this.reading,
      listening: listening ?? this.listening,
      writing: writing ?? this.writing,
      speaking: speaking ?? this.speaking,
    );
  }
}