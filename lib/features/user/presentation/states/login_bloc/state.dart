abstract class LoginState {}

class STALoginInit extends LoginState {}

class STALoginInProgress extends LoginState {}

class STALoginSucsess extends LoginState {
  final String email;
  STALoginSucsess({required this.email});
}

class STALoginError extends LoginState {
  final String message;

  STALoginError(this.message);
}