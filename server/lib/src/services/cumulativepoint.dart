import 'package:server/src/entities/cumulativepoint.dart';
import 'package:server/src/repositories/cumulativepoint.dart';

sealed class ICumulativeService {
  Stream<CumulativePointEntity> watchOne(String userEmail);
}

class CumulativeServiceImpl implements ICumulativeService {
  final _cumulativePointRepository = CumulativeRespositoryImpl();

  @override
  Stream<CumulativePointEntity> watchOne(String userEmail) {
    return _cumulativePointRepository.watchOne(userEmail);
  }
}