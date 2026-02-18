// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());

//   Future<void> loginUser(
//       {required String email, required String password}) async {
//     emit(LoginLoading());
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       emit(LoginSuccess());
//     } on FirebaseAuthException catch (ex) {
//       if (ex.code == 'user-not-found') {
//         emit(LoginFailure(errMessage: 'user not found'));
//       } else if (ex.code == 'wrong-password') {
//         emit(LoginFailure(errMessage: 'wrong password'));
//       }
//     } on Exception {
//       emit(LoginFailure(errMessage: 'something went wrong'));
//     }
//   }

//   Future<void> registerUser(
//       {required String email, required String password}) async {
//     emit(RegisterLoading());
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);

//       emit(RegisterSuccess(succMessage: 'Success'));
//     } on FirebaseAuthException catch (ex) {
//       if (ex.code == 'email-already-in-use') {
//         emit(RegisterFailure(errMessage: 'email already in use'));
//       } else if (ex.code == 'weak-password') {
//         emit(RegisterFailure(errMessage: 'weak password'));
//       }
//     } catch (ex) {
//       emit(RegisterFailure(errMessage: 'there was an error ,please try again'));
//     }
//   }

//   // @override
//   // void onChange(Change<AuthState> change) {
//   //   super.onChange(change);
//   //   debugPrint(change);
//   // }
// }
