import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../views/widgets/profile_picture_design_register.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? username = '', age = '', title = '';

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());

        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          await ensureUserDocumentExists(credential.user!.uid);

          emit(LoginSuccess());
        } on FirebaseAuthException catch (ex) {
          // 🔥🔥🔥 الجديد
          if (ex.code == 'account-exists-with-different-credential') {
            emit(LoginFailure(
                errMessage:
                    'Account exists with Google or Facebook. Use them to login.'));
          } else if (ex.code == 'user-not-found') {
            emit(LoginFailure(errMessage: 'User not found'));
          } else if (ex.code == 'wrong-password') {
            emit(LoginFailure(errMessage: 'Wrong password'));
          } else {
            emit(LoginFailure(errMessage: ex.message ?? 'Auth error'));
          }
        }
      }
      if (event is RegisterEvent) {
        emit(RegisterLoading());

        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          // Reference storageRef = await uploadImageToFirebaseStorage();
          // String urll = await storageRef.getDownloadURL();

          await ensureUserDocumentExists(credential.user!.uid);

          // uploadDataToFireStore(credential
          //     //  , urll
          //     );

          emit(RegisterSuccess(succMessage: 'Success'));
        } on FirebaseAuthException catch (ex) {
          // 🔥🔥🔥 لو الايميل موجود على Provider تاني
          if (ex.code == 'email-already-in-use') {
            final methods = await FirebaseAuth.instance
                .fetchSignInMethodsForEmail(event.email); // 🔥 NEW

            if (methods.contains('google.com')) {
              emit(RegisterFailure(
                  errMessage:
                      'Email registered with Google. Use Google login.'));
            } else if (methods.contains('facebook.com')) {
              emit(RegisterFailure(
                  errMessage:
                      'Email registered with Facebook. Use Facebook login.'));
            } else {
              emit(RegisterFailure(errMessage: 'Email already registered.'));
            }
          } else if (ex.code == 'weak-password') {
            emit(RegisterFailure(errMessage: 'Weak password'));
          }
        } catch (ex) {
          emit(
            RegisterFailure(errMessage: 'there was an error ,please try again'),
          );
        }
      }
    });
  }

  Future<Reference> uploadImageToFirebaseStorage() async {
    final storageRef = FirebaseStorage.instance.ref(
      "users-images/${ProfilePictureDesignRegister.imgName}",
    );
    await storageRef.putFile(ProfilePictureDesignRegister.imgPath!);
    return storageRef;
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

  void uploadDataToFireStore(UserCredential credential) {
    CollectionReference users = FirebaseFirestore.instance.collection(
      'users',
    );

    users
        .doc(credential.user!.uid)
        .collection('cart')
        .doc('cartData')
        .set({
          'products': [],
          'totalPrice': 0.0,
        })
        .then((value) => debugPrint("Cart Added"))
        .catchError((error) => debugPrint("Failed to add cart: $error"));

    users
        .doc(credential.user!.uid)
        .collection('order')
        .doc('orderlocation')
        .set({
          "title": "",
          "subtitle": "",
        })
        .then((value) => debugPrint("orderlocation Added"))
        .catchError(
            (error) => debugPrint("Failed to add orderlocation: $error"));
  }
}
