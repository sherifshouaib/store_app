import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/core/buttons/custom_text_button.dart';
import 'package:store_app/features/auth/presentation/manager/blocs/auth_bloc/auth_bloc.dart';
import 'package:store_app/features/auth/presentation/views/widgets/custom_row_sign.dart';
import 'package:store_app/features/auth/presentation/views/widgets/upper_body_Login.dart';

import '../../../../../core/buttons/custom_elevated_button.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/function/show_snack_bar.dart';
import '../../../../../core/widgets/custom_form_text_field.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          GoRouter.of(context).push(
            AppRouter.kBottomNavigationPage,
          );
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const UpperBodyLogin(),
                  // const Spacer(
                  //   flex: 2,
                  // ),
                  // Image.asset(
                  //   AssetsData.logo,
                  //   height: 150,
                  // ),
                  // const Text(
                  //   'AMAZON',
                  //   style: TextStyle(
                  //     fontSize: 32,
                  //     color: Colors.black,
                  //     fontFamily: 'PassionOne-Black',
                  //   ),
                  // ),
                  // const Spacer(
                  //   flex: 2,
                  // ),
                  // const Row(
                  //   children: [
                  //     Text(
                  //       'LOGIN',
                  //       style: TextStyle(
                  //         fontSize: 24,
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 12,
                  // ),

                  CustomFormTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    texttype: TextInputType.emailAddress,
                    textfieldmessage: 'Email',
                    icon: const Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      password = data;
                    },
                    texttype: TextInputType.text,
                    textfieldmessage: 'Password',
                    icon: const Icon(Icons.visibility_rounded),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomElevatedButton(
                    colorfill: Colors.redAccent,
                    text: 'Login',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                            loginEvent(email: email!, password: password!));
                      } else {}
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  CustomTextButton(
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.kForgotPassView,
                      );
                    },
                    text2: 'Forgot password',
                    fontSize: 18,
                  ),

                  // const CommonReglogBody(
                  //   textfield1message: 'Email',
                  //   textfield2message: 'Password',
                  //   buttonmessage: 'Login',
                  // ),

                  // const CustomButton(
                  //   text1: 'LOGIN',
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomRowSign(
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.kRegisterView,
                      );
                    },
                    text1: 'don\'t have an account ?',
                    text2: ' Register',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
