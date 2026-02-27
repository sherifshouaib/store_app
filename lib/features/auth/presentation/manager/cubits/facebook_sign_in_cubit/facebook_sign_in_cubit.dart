import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'facebook_sign_in_state.dart';

class FacebookSignInCubit extends Cubit<FacebookSignInState> {
  FacebookSignInCubit() : super(FacebookSignInInitial());
  String? username = '', age = '', title = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithFacebook() async {
    emit(FacebookSignInLoading());

    try {
      final loginResult = await FacebookAuth.instance.login();

      if (loginResult.status != LoginStatus.success) {
        emit(FacebookSignInFailure("Facebook login cancelled"));
        return null;
      }

      final facebookCredential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );

      try {
        // محاولة تسجيل الدخول مباشرة
        final userCredential =
            await _auth.signInWithCredential(facebookCredential);

        await ensureUserDocumentExists(userCredential.user!.uid);

        emit(FacebookSignInSuccess());
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          final email = e.email;
          final pendingCredential = e.credential;

          if (email == null || pendingCredential == null) {
            emit(FacebookSignInFailure("Authentication error"));
            return null;
          }

          final methods = await _auth.fetchSignInMethodsForEmail(email);

          // لو موجود على Google
          if (methods.contains('google.com')) {
            final googleUser = await _googleSignIn.signIn();
            if (googleUser == null) {
              emit(FacebookSignInFailure("Google sign in cancelled"));
              return null;
            }

            final googleAuth = await googleUser.authentication;
            final googleCredential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            );

            final userCredential =
                await _auth.signInWithCredential(googleCredential);

            await userCredential.user!.linkWithCredential(pendingCredential);

            await ensureUserDocumentExists(userCredential.user!.uid);

            emit(FacebookSignInSuccess());
            return userCredential;
          }

          // لو موجود على Email/Password
          else if (methods.contains('password')) {
            emit(FacebookSignInFailure(
                "This email is already registered. Sign in with Email & Password to link Facebook."));
            return null;
          }

          // أي provider تاني
          else {
            emit(FacebookSignInFailure(
                "Account exists with another provider: ${methods.join(', ')}"));
            return null;
          }
        }

        emit(FacebookSignInFailure(e.message ?? "Auth error"));
        return null;
      }
    } catch (e) {
      emit(FacebookSignInFailure("Unexpected error"));
      return null;
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

  // Future<UserCredential> signInWithFacebook(BuildContext context) async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   log(loginResult.accessToken!.tokenString.toString());
  //   log(loginResult.message.toString());

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  //   emit(FacebookSignInExecution());

  //   //igned in, return the UserCredential
  //   UserCredential userCredential = await FirebaseAuth.instance
  //       .signInWithCredential(facebookAuthCredential);

  //   log(userCredential.additionalUserInfo!.username.toString());
  //   log(userCredential.user!.email.toString());
  //   log(userCredential.user!.photoURL.toString());

  //   return userCredential;
  // }
}
