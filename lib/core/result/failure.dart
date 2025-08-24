sealed class Failure {
  final Object error;

  const Failure(this.error);

  @override
  String toString() {
    return 'Failure{error: $error}';
  }
}

//=== Auth Failures ===
sealed class AuthFailure extends Failure {
  const AuthFailure(super.error);

  const factory AuthFailure.invalidCredentials() = InvalidCredentials;
  const factory AuthFailure.unauthorized() = Unauthorized;
  const factory AuthFailure.network() = AuthNetworkFailure;
}

class InvalidCredentials extends AuthFailure {
  const InvalidCredentials() : super("Invalid credentials");
}

class Unauthorized extends AuthFailure {
  const Unauthorized() : super("Unauthorized");
}

class AuthNetworkFailure extends AuthFailure {
  const AuthNetworkFailure() : super("Network error");
}

//=== Network Failures ===
sealed class NetworkFailure extends Failure {
  const NetworkFailure(super.error);

  const factory NetworkFailure.timeout() = TimeoutFailure;
  const factory NetworkFailure.noConnection() = NoConnectionFailure;
}

class TimeoutFailure extends NetworkFailure {
  const TimeoutFailure() : super("Request timeout");
}

class NoConnectionFailure extends NetworkFailure {
  const NoConnectionFailure() : super("No internet connection");
}

//=== Database Failures ===
sealed class DatabaseFailure extends Failure {
  const DatabaseFailure(super.error);

  const factory DatabaseFailure.notFound() = NotFoundFailure;
  const factory DatabaseFailure.writeError() = WriteErrorFailure;
}

class NotFoundFailure extends DatabaseFailure {
  const NotFoundFailure() : super("Data not found");
}

class WriteErrorFailure extends DatabaseFailure {
  const WriteErrorFailure() : super("Failed to write data");
}
