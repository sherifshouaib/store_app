import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:store_app/core/utils/function/handle_authentication.dart';

part 'facebook_sign_in_state.dart';

class FacebookSignInCubit extends Cubit<FacebookSignInState> {
  FacebookSignInCubit() : super(FacebookSignInInitial());

  String? username = '', age = '', title = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

      final userCredential =
          await handleOAuthLogin(facebookCredential);

      if (userCredential != null) {
        await ensureUserDocumentExists(userCredential.user!.uid);
        emit(FacebookSignInSuccess());
      }

      return userCredential;

    } on FirebaseAuthException catch (e) {

      if (e.code == 'need-password') {
        emit(FacebookSignInFailure(e.message ?? ""));
      } else {
        emit(FacebookSignInFailure(e.message ?? "Auth error"));
      }

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
}
