part of 'google_sign_in_cubit.dart';

abstract class GoogleSignInState extends Equatable {
  const GoogleSignInState();

  @override
  List<Object?> get props => [];
}

class GoogleSignInInitial extends GoogleSignInState {}

class GoogleSignInLoading extends GoogleSignInState {}

class GoogleSignInSuccess extends GoogleSignInState {}

class GoogleSignInFailure extends GoogleSignInState {
  final String message;

  const GoogleSignInFailure(this.message);

  @override
  List<Object?> get props => [message];
}



// part of 'google_sign_in_cubit.dart';

// sealed class GoogleSignInState extends Equatable {
//   const GoogleSignInState();

//   @override
//   List<Object> get props => [];
// }

// final class GoogleSignInInitial extends GoogleSignInState {}

// final class GoogleSignExecution extends GoogleSignInState {}
