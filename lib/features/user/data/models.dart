import 'package:kikitalk/core/database/tables/user_table.dart';
import 'package:kikitalk/features/user/domain/user_entity.dart';

UserTable get _table => UserTable.instance;

class MODUser extends ENTUser {
  MODUser({
    required super.name,
    required super.email,
    super.avatar,
  });

  Map<String, dynamic> toMap() {
    return {
      _table.columnName: name,
      _table.columnEmail: email,
      _table.columnAvatar: avatar ?? '',
    };
  }

  factory MODUser.fromMap(Map<String, dynamic> map) {
    return MODUser(
      name: map[_table.columnName] as String,
      email: map[_table.columnEmail] as String,
      avatar: map[_table.columnAvatar] as String?,
    );
  }
}