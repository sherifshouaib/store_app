part of 'facebook_sign_in_cubit.dart';

sealed class FacebookSignInState extends Equatable {
  const FacebookSignInState();

  @override
  List<Object?> get props => [];
}

final class FacebookSignInInitial extends FacebookSignInState {}
final class FacebookSignInLoading extends FacebookSignInState {}
final class FacebookSignInSuccess extends FacebookSignInState {}
final class FacebookSignInFailure extends FacebookSignInState {
  final String message;

  const FacebookSignInFailure(this.message);

  @override
  List<Object?> get props => [message];
}



//final class FacebookSignInExecution extends FacebookSignInState {}


