
abstract class AuthState {}

class STAAuthInitial extends AuthState {}

class STAAuthLoading extends AuthState {}

class STAAuthSuccess extends AuthState {
  final String email;
  STAAuthSuccess({required this.email});
}

class STAAuthFailure extends AuthState {
  final String message;
  STAAuthFailure({required this.message});
}

class STAAuthSignOut extends AuthState {}