part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class loginEvent extends AuthEvent {
  final String email;
  final String password;
  const loginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  const RegisterEvent({required this.email, required this.password});
}
