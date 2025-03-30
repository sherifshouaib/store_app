import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../home/data/models/product_model/product_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? username, age, title, email, password;
  double price = 0;
  List<ProductModel> selectedProducts = [];
  List<double> prices = [];
  List<String> titles = [];
  List<String> images = [];

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is loginEvent) {
        emit(LoginLoading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          // print(FirebaseAuth.instance.currentUser!);
          // print(FirebaseAuth.instance.currentUser!.displayName);
          // print(FirebaseAuth.instance.currentUser!.email);
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
          final UserCredential credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          CollectionReference users =
              FirebaseFirestore.instance.collection('usersss');

          users
              .doc(credential.user!.uid)
              .set({
                'username': username,
                'age': age,
                'title': title,
                'email': email,
                'pass': password,
                'price': price,
                'selectedProductslength': selectedProducts.length,
                'prices': prices,
                'titles': titles,
                'images': images,
              })
              .then((value) => print("User Added"))
              .catchError((error) => print("Failed to add user: $error"));

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
