import 'package:server/src/database/tables/app_tables.dart';
import 'package:server/src/entities/skills.dart';

get _table => TableSchemas.skills;

class SkillsDTO extends SkillsEntity {
  SkillsDTO({
    required super.id,
    required super.userEmail,
    required super.reading,
    required super.listening,
    required super.writing,
    required super.speaking,
  });

  Map<String, dynamic> toJson() {
    return {
      _table.columnId: id,
      _table.columnUserEmail: userEmail,
      _table.columnReading: reading,
      _table.columnListening: listening,
      _table.columnWriting: writing,
      _table.columnSpeaking: speaking,
    };
  }

  SkillsEntity toEntity() {
    return SkillsEntity(
      id: id,
      userEmail: userEmail,
      reading: reading,
      listening: listening,
      writing: writing,
      speaking: speaking,
    );
  }

  factory SkillsDTO.fromJson(Map<String, dynamic> json) {
    return SkillsDTO(
      id: json[_table.columnId] as String,
      userEmail: json[_table.columnUserEmail] as String,
      reading: json[_table.columnReading] as double,
      listening: json[_table.columnListening] as double,
      writing: json[_table.columnWriting] as double,
      speaking: json[_table.columnSpeaking] as double,
    );
  }

  factory SkillsDTO.fromEntity(SkillsEntity entity) {
    return SkillsDTO(
      id: entity.id,
      userEmail: entity.userEmail,
      reading: entity.reading,
      listening: entity.listening,
      writing: entity.writing,
      speaking: entity.speaking,
    );
  }
}