import 'package:server/src/database/tables/app_tables.dart';
import 'package:server/src/entities/user.dart';

get _table => TableSchemas.user;

class UserDTO extends UserEntity {
  UserDTO({
    required super.email,
    required super.name,
    required super.avatar
  });

  Map<String, dynamic> toJson() {
    return {
      _table.columnEmail: email,
      _table.columnName: name,
      _table.columnAvatar: avatar,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      email: email,
      name: name,
      avatar: avatar,
    );
  }

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      email: json[_table.columnEmail] as String,
      name: json[_table.columnName] as String,
      avatar: json[_table.columnAvatar] as String,
    );
  }

  factory UserDTO.fromEntity(UserEntity entity) {
    return UserDTO(
      email: entity.email,
      name: entity.name,
      avatar: entity.avatar,
    );
  }
}