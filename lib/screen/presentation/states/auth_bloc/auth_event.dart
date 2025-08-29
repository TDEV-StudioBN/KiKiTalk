abstract class AuthEvent {}

class EVEAuth extends AuthEvent {
  final String email;
  EVEAuth({required this.email});
}

class EVESingout extends AuthEvent {}

class EVEGetAuth extends AuthEvent {}