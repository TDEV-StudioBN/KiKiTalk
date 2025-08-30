/// Kết quả trả về tương tự backend thật
/// [Success200]
/// [BadRequest400]
/// [NotFound404]
/// [InternalServerError500]
sealed class Response {
  final int status;
  const Response(this.status);

  Map<String, dynamic> toJson();
}

sealed class IFutureResponse {}
sealed class IStreamResponse {}

class FutureResponse extends IFutureResponse {
  final Future<Response> _future;
  FutureResponse(this._future);
  FutureResponse.value(Response response) : _future = Future.value(response);

  Future<Map<String, dynamic>> futureJson() async {
    return (await _future).toJson();
  }
}

/// Kết quả trả về `stream` [Response]
class StreamResponse extends IStreamResponse {
  final Stream<Response> _stream;
  StreamResponse(this._stream);
  StreamResponse.value(Response response) : _stream = Stream.value(response);

  Stream<Map<String, dynamic>> streamJson() {
    return _stream.map((res) => res.toJson());
  }
}

/// Thành công 200 (Success)
/// Dùng khi xử lý API thành công, trả về dữ liệu
class Success200 extends Response {
  final Map<String, dynamic> data;

  const Success200(this.data) : super(200);

  @override
  Map<String, dynamic> toJson() => {
    'status': status,
    'data': data,
  };
}

/// Lỗi Bad Request 400
/// Dùng khi client gửi dữ liệu thiếu hoặc không hợp lệ
class BadRequest400 extends Response {
  final String message;

  const BadRequest400({this.message = 'Dữ liệu không hợp lệ'}) : super(400);

  @override
  Map<String, dynamic> toJson() => {
    'status': status,
    'error': message,
  };
}

/// Lỗi Not Found 404
/// Dùng khi không tìm thấy tài nguyên yêu cầu
class NotFound404 extends Response {
  final String message;

  const NotFound404({this.message = 'Không tìm thấy'}) : super(404);

  @override
  Map<String, dynamic> toJson() => {
    'status': status,
    'error': message,
  };
}

/// Lỗi Internal Server Error 500
/// Dùng khi có lỗi xảy ra ở server
class InternalServerError500 extends Response {
  final String message;

  const InternalServerError500({this.message = 'Lỗi server'}) : super(500);

  @override
  Map<String, dynamic> toJson() => {
    'status': status,
    'error': message,
  };
}
