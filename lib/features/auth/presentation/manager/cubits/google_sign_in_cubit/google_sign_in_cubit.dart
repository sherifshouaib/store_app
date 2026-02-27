import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  String? username = '', age = '', title = '';

  GoogleSignInCubit() : super(GoogleSignInInitial());
  final FirebaseAuth _auth = FirebaseAuth.instance; // 🔥 NEW

  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        emit(GoogleSignInFailure("Login canceled"));
        return;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        final userCredential = await _auth.signInWithCredential(credential);
        await ensureUserDocumentExists(userCredential.user!.uid);

        emit(GoogleSignInSuccess());
      } on FirebaseAuthException catch (e) {
        // 🔥🔥🔥 CONFLICT HANDLER
        if (e.code == 'account-exists-with-different-credential') {
          final email = e.email;
          final pendingCredential = e.credential;

          if (email == null || pendingCredential == null) {
            emit(GoogleSignInFailure("Authentication error"));
            return;
          }

          final methods = await _auth.fetchSignInMethodsForEmail(email);

          // 🔥 لو موجود Facebook
          if (methods.contains('facebook.com')) {
            final result = await FacebookAuth.instance.login();

            if (result.status != LoginStatus.success) return;

            final facebookCredential = FacebookAuthProvider.credential(
              result.accessToken!.tokenString,
            );

            final userCredential =
                await _auth.signInWithCredential(facebookCredential);

            await userCredential.user!.linkWithCredential(pendingCredential);
            await ensureUserDocumentExists(userCredential.user!.uid);

            emit(GoogleSignInSuccess());
            return;
          }

          // 🔥 لو password
          if (methods.contains('password')) {
            emit(GoogleSignInFailure(
                "Login with email & password first to link Google."));
            return;
          }
        }

        emit(GoogleSignInFailure(e.message ?? "Auth error"));
      }
    } catch (e) {
      emit(GoogleSignInFailure(e.toString()));
    }
  }

  Future<void> ensureUserDocumentExists(String uid) async {
    CollectionReference users = FirebaseFirestore.instance.collection(
      'users',
    );
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (!userDoc.exists) {
      await users
          .doc(uid)
          .collection('user')
          .doc('userData')
          .set({
            'imgLink': '',
            'username': username,
            'age': age,
            'title': title,
          })
          .then((value) => debugPrint("User Added"))
          .catchError((error) => debugPrint("Failed to add user: $error"));

      await users.doc(uid).collection('cart').doc('cartData').set({
        'products': [],
        'totalPrice': 0.0,
      });

      await users.doc(uid).collection('order').doc('orderlocation').set({
        "title": "",
        "subtitle": "",
      });
    }
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     emit(GoogleSignInLoading());

  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     if (googleUser == null) {
  //       emit(GoogleSignInFailure("Login canceled by user"));
  //       return;
  //     }

  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     await FirebaseAuth.instance.signInWithCredential(credential);

  //     emit(GoogleSignInSuccess());
  //   } catch (e) {
  //     emit(GoogleSignInFailure(e.toString()));
  //   }
  // }
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
