import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/core/usecase/usecase.dart';
import 'package:kikitalk/screen/domain/entities/auth_entity.dart';
import 'package:kikitalk/screen/domain/repositories/auth_repository.dart';

class UCEGetAuth extends UseCase<ENTAuth?, NoParams> {
  final REPAuth _repository;
  UCEGetAuth(this._repository);

  @override
  Future<Result<ENTAuth?>> call(NoParams params) {
    return _repository.getAuth();
  }
}