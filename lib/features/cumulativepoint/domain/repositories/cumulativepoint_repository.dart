import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/features/cumulativepoint/domain/entities/cumulativepoint_entity.dart';

abstract interface class REPCumulativePoint {
  Stream<Result<ENTCumulativePoint>> getCumulativePoint({required String email});
}