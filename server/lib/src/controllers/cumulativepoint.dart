import 'package:server/src/controllers/apis.dart';
import 'package:server/src/controllers/response.dart';
import 'package:server/src/dtos/cumulativepoint.dart';
import 'package:server/src/services/cumulativepoint.dart';

sealed class ICumulativePointController extends APIController {

  /// RealTime
  /// Tham số [request] = {'userEmail': 'abc@.com'};
  StreamResponse watchCumulativePoint(Map<String, Object?> request);
}

class CumulativePointControllerImpl extends ICumulativePointController {
  final _cumulativePointService = CumulativeServiceImpl();

  @override
  StreamResponse watchCumulativePoint(Map<String, Object?> request) {
    try {
      final emailRaw = request['userEmail'];

      if (emailRaw is! String) {
        return StreamResponse(Stream.value(
          BadRequest400(message: 'userEmail phải là chuỗi'),
        ));
      }
      final userEmail = emailRaw;
      if (userEmail.isEmpty) {
        return StreamResponse(Stream.value(BadRequest400()));
      }

      final stream = _cumulativePointService
          .watchOne(userEmail)
          .map((entity) => Success200(CumulativePointDTO.fromEntity(entity).toJson()));

      return StreamResponse(stream);
    } catch (e) {
      return StreamResponse(Stream.value(InternalServerError500()));
    }
  }
}