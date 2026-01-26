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
  String? username, age, title, email, password;
  //double price = 0;
//  List<ProductModel> selectedProducts = [];
  // List<double> prices = [];
  // List<String> titles = [];
  // List<String> images = [];

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          // debugPrint(FirebaseAuth.instance.currentUser!);
          // debugPrint(FirebaseAuth.instance.currentUser!.displayName);
          // debugPrint(FirebaseAuth.instance.currentUser!.email);
          emit(LoginSuccess());
        } on FirebaseAuthException catch (ex) {
          if (ex.code == 'user-not-found') {
            emit(LoginFailure(errMessage: 'user not found'));
          } else if (ex.code == 'wrong-password') {
            emit(LoginFailure(errMessage: 'wrong password'));
          }
        } on Exception {
          emit(LoginFailure(errMessage: 'something went wrong'));
        }
      }
      if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          final UserCredential credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          // Upload image to firebase storage
          Reference storageRef = await uploadImageToFirebaseStorage();

          // Get img url
          String urll = await storageRef.getDownloadURL();

          debugPrint(credential.user!.uid);
          uploadDataToFireStore(credential, urll);

          emit(RegisterSuccess(succMessage: 'Success'));
        } on FirebaseAuthException catch (ex) {
          if (ex.code == 'email-already-in-use') {
            emit(RegisterFailure(errMessage: 'email already in use'));
          } else if (ex.code == 'weak-password') {
            emit(RegisterFailure(errMessage: 'weak password'));
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

  void uploadDataToFireStore(UserCredential credential, String urll) {
    CollectionReference users = FirebaseFirestore.instance.collection(
      'users',
    );

    users
        .doc(credential.user!.uid)
        .collection('user')
        .doc('userData')
        .set({
          'imgLink': urll,
          'username': username,
          'age': age,
          'title': title,
          'email': email,
          'pass': password,
          ///////////////////////////////
          //  'price': price,
          // 'selectedProductslength': 0,
          // 'prices': prices,
          // 'titles': titles,
          // 'images': images,
        })
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));

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
        .catchError((error) => debugPrint("Failed to add orderlocation: $error"));
  }

  // @override
  // void onTransition(Transition<AuthEvent, AuthState> transition) {
  //   super.onTransition(transition);
  //   debugPrint(transition);
  // }
}
