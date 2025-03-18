import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is loginEvent) {
        emit(LoginLoading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(LoginSuccess());
        } on FirebaseAuthException catch (ex) {
          if (ex.code == 'user-not-found') {
            emit(LoginFailure(errMessage: 'user not found'));
          } else if (ex.code == 'wrong-password') {
            emit(LoginFailure(errMessage: 'wrong password'));
          }
        } on Exception catch (ex) {
          emit(LoginFailure(errMessage: 'something went wrong'));
        }
      }
      if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: event.email, password: event.password);

          emit(RegisterSuccess(succMessage: 'Success'));
        } on FirebaseAuthException catch (ex) {
          if (ex.code == 'email-already-in-use') {
            emit(RegisterFailure(errMessage: 'email already in use'));
          } else if (ex.code == 'weak-password') {
            emit(RegisterFailure(errMessage: 'weak password'));
          }
        } catch (ex) {
          emit(RegisterFailure(
              errMessage: 'there was an error ,please try again'));
        }
      }
    });
  }

  // @override
  // void onTransition(Transition<AuthEvent, AuthState> transition) {
  //   // TODO: implement onTransition
  //   super.onTransition(transition);
  //   print(transition);
  // }
}
