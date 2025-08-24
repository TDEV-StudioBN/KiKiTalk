import 'package:kikitalk/core/database/tables/skills_table.dart';
import 'package:kikitalk/features/skills/domain/entities/skills_entity.dart';

SkillsTable get _table => SkillsTable.instance;

class MODSkills extends ENTSkills {
  MODSkills({
    required super.id,
    required super.userEmail,
    required super.reading,
    required super.listening,
    required super.writing,
    required super.speaking
  });

  Map<String, dynamic> toMap() {
    return {
      _table.columnId: id,
      _table.columnUserEmail: userEmail,
      _table.columnReading: reading,
      _table.columnListening: listening,
      _table.columnWriting: writing,
      _table.columnSpeaking: speaking,
    };
  }

  factory MODSkills.fromMap(Map<String, dynamic> map) {
    return MODSkills(
      id: map[_table.columnId] as int,
      userEmail: map[_table.columnUserEmail] as String,
      reading: (map[_table.columnReading] as num).toDouble(),
      listening: (map[_table.columnListening] as num).toDouble(),
      writing: (map[_table.columnWriting] as num).toDouble(),
      speaking: (map[_table.columnSpeaking] as num).toDouble(),
    );
  }
}