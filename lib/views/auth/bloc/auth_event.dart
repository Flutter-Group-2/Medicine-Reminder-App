part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String name;
  final String password;
  final String email;

  SignUpEvent({
    required this.email,
    required this.name,
    required this.password,
  });
}

class LoginEvent extends AuthEvent {
  final String password;
  final String email;

  LoginEvent({
    required this.email,
    required this.password,
  });
}
