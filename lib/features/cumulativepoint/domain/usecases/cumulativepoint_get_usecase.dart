import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/core/usecase/usecase.dart';
import 'package:kikitalk/features/cumulativepoint/domain/entities/cumulativepoint_entity.dart';
import 'package:kikitalk/features/cumulativepoint/domain/repositories/cumulativepoint_repository.dart';

class UCECumulativePointWatch extends StreamUseCase<ENTCumulativePoint, UCECumulativePointWatchParams> {
  final REPCumulativePoint _repository;
  UCECumulativePointWatch(this._repository);

  @override
  Stream<Result<ENTCumulativePoint>> call(UCECumulativePointWatchParams params) {
    return _repository.getCumulativePoint(email: params.email);
  }
}

class UCECumulativePointWatchParams {
  final String email;
  UCECumulativePointWatchParams({required this.email});
}
