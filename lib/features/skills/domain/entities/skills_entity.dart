
class ENTSkills {
  final int id;
  final String userEmail;
  final double reading;
  final double listening;
  final double writing;
  final double speaking;

  ENTSkills({
    required this.id,
    required this.userEmail,
    required this.reading,
    required this.listening,
    required this.writing,
    required this.speaking,
  });

  @override
  String toString() {
    return 'ENTSkills(id: $id, userEmail: $userEmail, reading: $reading, listening: $listening, writing: $writing, speaking: $speaking)';
  }
}