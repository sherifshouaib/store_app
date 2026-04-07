import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store_app/core/utils/function/handle_authentication.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit() : super(GoogleSignInInitial());

  String? username = '', age = '', title = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());

    try {
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        emit(GoogleSignInFailure("Login cancelled"));
        return;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await handleOAuthLogin(credential);

      if (userCredential != null) {
        await ensureUserDocumentExists(userCredential.user!.uid);
        emit(GoogleSignInSuccess());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'need-password') {
        emit(GoogleSignInFailure(e.message ?? ""));
      } else {
        emit(GoogleSignInFailure(e.message ?? "Auth error"));
      }
    }
  }

  Future<void> ensureUserDocumentExists(String uid) async {
    final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
    final cartDoc = await userDoc.collection('cart').doc('cartData').get();
    final userDataDoc = await userDoc.collection('user').doc('userData').get();

    // لو userData مش موجود → أنشئه
    if (!userDataDoc.exists) {
      await userDoc.collection('user').doc('userData').set({
        'imgLink': '',
        'username': username,
      });
    }

    // لو cart مش موجود → أنشئ cart فارغ
    if (!cartDoc.exists) {
      await userDoc.collection('cart').doc('cartData').set({
        'products': [],
        'totalPrice': 0.0,
      });
    }

    // لو order location مش موجود → أنشئه
    final orderDoc =
        await userDoc.collection('order').doc('orderlocation').get();
    if (!orderDoc.exists) {
      await userDoc.collection('order').doc('orderlocation').set({
        "title": "",
        "subtitle": "",
      });
    }
  }
}
