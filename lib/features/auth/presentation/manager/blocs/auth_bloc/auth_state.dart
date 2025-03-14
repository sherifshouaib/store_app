part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  String succMessage;
  RegisterSuccess({required this.succMessage});
}

final class RegisterFailure extends AuthState {
  String errMessage;
  RegisterFailure({required this.errMessage});
}

final class LoginSuccess extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginFailure extends AuthState {
  String errMessage;

  LoginFailure({
    required this.errMessage,
  });
}
