import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/core/usecase/usecase.dart';
import 'package:kikitalk/screen/domain/entities/auth_entity.dart';
import 'package:kikitalk/screen/domain/repositories/auth_repository.dart';

class UCEAuth extends UseCase<bool, AuthParams> {
  final REPAuth _repository;
  UCEAuth(this._repository);

  @override
  Future<Result<bool>> call(AuthParams params) {
    final newAuth = ENTAuth(emailAuth: params.email, isAuthorized: true);
    return _repository.auth(newAuth);
  }
}

class AuthParams {
  final String email;
  AuthParams({required this.email});
}