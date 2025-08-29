import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit() : super(GoogleSignInInitial());

  Future<void> signInWithGoogle() async {
    try {
      emit(GoogleSignInLoading());

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        emit(GoogleSignInFailure("Login canceled by user"));
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      emit(GoogleSignInSuccess());
    } catch (e) {
      emit(GoogleSignInFailure(e.toString()));
    }
  }
}

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../../../../../../core/utils/app_router.dart';
// import '../../../../../home/presentation/manager/cart_cubit/cart_cubit.dart';

// part 'google_sign_in_state.dart';

// class GoogleSignInCubit extends Cubit<GoogleSignInState> {
//   GoogleSignInCubit() : super(GoogleSignInInitial());

// //   final googleSignIn = GoogleSignIn();
// //   GoogleSignInAccount? _user;
// //   GoogleSignInAccount get user => _user!;
// //   googlelogin( BuildContext context) async {
// //     final googleUser = await googleSignIn.signIn();
// //     if (googleUser == null) {
// //       return;
// //     }
// //     if (googleSignIn == null) return;
// //     _user = googleUser;
// //     final googleAuth = await googleUser?.authentication;
// //     final credential = GoogleAuthProvider.credential(
// //       accessToken: googleAuth?.accessToken,
// //       idToken: googleAuth?.idToken,
// //     );
// //     await FirebaseAuth.instance.signInWithCredential(credential);
// //  GoRouter.of(context).push(
// //       AppRouter.kBottomNavigationPage,
// //     );
// //     emit(GoogleSignExecution());
// //   }

//   Future signInWithGoogle(BuildContext context) async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     if (googleUser == null) {
//       return;
//     }
//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;

//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//     // Once signed in, return the UserCredential
//     final UserCredential user =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//     onloginSuccess(context);

//     GoRouter.of(context).push(
//       AppRouter.kBottomNavigationPage,
//     );
//     emit(GoogleSignExecution());
//   }

//   void onloginSuccess(BuildContext context) {
//     context.read<CartCubit>().loadCart();
//   }
// }
