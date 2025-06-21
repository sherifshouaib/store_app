part of 'facebook_sign_in_cubit.dart';

sealed class FacebookSignInState extends Equatable {
  const FacebookSignInState();

  @override
  List<Object> get props => [];
}

final class FacebookSignInInitial extends FacebookSignInState {}

final class FacebookSignInExecution extends FacebookSignInState {}
