import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/core/usecase/usecase.dart';
import 'package:kikitalk/screen/domain/repositories/auth_repository.dart';

class UCESingout extends UseCase<bool, NoParams> {
  final REPAuth _repository;
  UCESingout(this._repository);

  @override
  Future<Result<bool>> call(NoParams params) {
    return _repository.signOut();
  }
}

