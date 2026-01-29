import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

part 'facebook_sign_in_state.dart';

class FacebookSignInCubit extends Cubit<FacebookSignInState> {
  FacebookSignInCubit() : super(FacebookSignInInitial());

  Future<UserCredential> signInWithFacebook(BuildContext context) async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    log(loginResult.accessToken!.tokenString.toString());
    log(loginResult.message.toString());

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    emit(FacebookSignInExecution());

    //igned in, return the UserCredential
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    log(userCredential.additionalUserInfo!.username.toString());
    log(userCredential.user!.email.toString());
    log(userCredential.user!.photoURL.toString());

    return userCredential;
  }
}
