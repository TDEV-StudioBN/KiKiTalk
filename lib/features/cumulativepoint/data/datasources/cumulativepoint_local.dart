import 'package:kikitalk/core/server/server_local.dart';
import 'package:kikitalk/features/cumulativepoint/data/models/cumulativepoint_model.dart';

sealed class LDSCumulativePoint {
  Stream<MODCumulativePoint> getCumulativePoint({required String email});
}

class LDSCumulativePointImpl extends LDSCumulativePoint {
  ServerLocal get _server => ServerLocal.instance;

  @override
  Stream<MODCumulativePoint> getCumulativePoint({required String email}) {
    final responseStream = _server.stream(
      _server.apis.cumulativePoint.watchCumulativePoint({'userEmail': email}),
    );

    return responseStream.map((json) {
      if (json['status'] == 200 && json['data'] != null) {
        return MODCumulativePoint.fromMap(json['data']);
      } else {
        throw Exception(json['error'] ?? 'Unknown error');
      }
    });
  }
}