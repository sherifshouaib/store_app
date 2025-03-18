part of 'google_sign_in_cubit.dart';

sealed class GoogleSignInState extends Equatable {
  const GoogleSignInState();

  @override
  List<Object> get props => [];
}

final class GoogleSignInInitial extends GoogleSignInState {}

final class GoogleSignExecution extends GoogleSignInState {}
