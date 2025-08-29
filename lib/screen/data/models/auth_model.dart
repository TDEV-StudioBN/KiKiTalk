import 'package:kikitalk/screen/domain/entities/auth_entity.dart';

class MODAuth extends ENTAuth {
  MODAuth({
    required super.emailAuth,
    required super.isAuthorized
  });

  Map<String, dynamic> toMap() {
    return {
      'userAuth': emailAuth,
      'isAuthorized': isAuthorized
    };
  }

  factory MODAuth.fromMap(Map<String, dynamic> map) {
    return MODAuth(
      emailAuth: map['userAuth'] as String,
      isAuthorized: map['isAuthorized'] as bool
    );
  }

  factory MODAuth.fromEntity(ENTAuth entity) {
    return MODAuth(
      emailAuth: entity.emailAuth,
      isAuthorized: entity.isAuthorized
    );
  }
}