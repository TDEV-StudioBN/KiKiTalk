import 'package:kikitalk/core/log/log.dart';
import 'package:kikitalk/core/result/failure.dart';
import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/features/cumulativepoint/data/datasources/cumulativepoint_local.dart';
import 'package:kikitalk/features/cumulativepoint/domain/entities/cumulativepoint_entity.dart';
import 'package:kikitalk/features/cumulativepoint/domain/repositories/cumulativepoint_repository.dart';

class REPCumulativePointImpl implements REPCumulativePoint {
  final LDSCumulativePoint _local;
  REPCumulativePointImpl(this._local);

  @override
  Stream<Result<ENTCumulativePoint>> getCumulativePoint({required String email}) async* {
    try {
      await for (final entity in _local.getCumulativePoint(email: email)) {
        yield Success(entity);
      }
    } catch (e, s) {
      logError('Error in getCumulativePoint', stackTrace: s);
      yield const Fail(GetErrorFailure());
    }
  }
}