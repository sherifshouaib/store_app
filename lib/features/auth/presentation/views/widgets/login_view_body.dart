import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/auth/presentation/manager/blocs/auth_bloc/auth_bloc.dart';
import 'package:store_app/features/auth/presentation/manager/cubits/facebook_sign_in_cubit/facebook_sign_in_cubit.dart';
import 'package:store_app/features/auth/presentation/manager/cubits/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:store_app/features/auth/presentation/views/widgets/no_logic_part.dart';
import 'package:store_app/features/auth/presentation/views/widgets/upper_body_login.dart';

import '../../../../../core/buttons/custom_elevated_button.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/function/show_snack_bar.dart';
import '../../../../../core/widgets/custom_form_text_field.dart';
import 'sign_in_methods.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isVisible = false;

  bool isLoading = false;

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              isLoading = true;
            } else if (state is LoginSuccess) {
              // GoRouter.of(context).push(
              //   AppRouter.kBottomNavigationPage,
              // );
              GoRouter.of(context).push(
                AppRouter.kVerifyEmailView,
              );
              isLoading = false;
            } else if (state is LoginFailure) {
              showSnackBar(context, state.errMessage);
              isLoading = false;
            }
          },
        ),
        BlocListener<GoogleSignInCubit, GoogleSignInState>(
          listener: (context, state) {
            if (state is GoogleSignExecution) {
              BlocProvider.of<GoogleSignInCubit>(context)
                  .signInWithGoogle(context);
            }
          },
        ),
        BlocListener<FacebookSignInCubit, FacebookSignInState>(
          listener: (context, state) {
            if (state is FacebookSignInExecution) {
              BlocProvider.of<FacebookSignInCubit>(context)
                  .signInWithFacebook(context);
            }
          },
        ),
      ],
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
                  CustomFormTextField(
                    validator: (data) {
                      return data!.contains(RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#//$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                          ? null
                          : 'Enter a valid email';
                    },
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
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'field is required';
                      }
                      return null;
                    },
                    onChanged: (data) {
                      password = data;
                    },
                    texttype: TextInputType.text,
                    obscureText: isVisible ? false : true,
                    textfieldmessage: 'Password',
                    icon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: isVisible
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.white,
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomElevatedButton(
                    colorfill: TColor.primary,
                    text: 'Login',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                      //  isLoading = true;

                        BlocProvider.of<AuthBloc>(context).add(
                            LoginEvent(email: email!, password: password!));
                        //isLoading = false;
                      } else {}
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const NoLogicPart(),
                  SignInMethods(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> loginUser() async {
  //   UserCredential user = await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email!, password: password!);
  // }

  // Future<UserCredential> signInWithFacebook(BuildContext context) async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login( );

  //   log(loginResult.accessToken!.tokenString.toString());
  //   log(loginResult.message.toString());

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential('${loginResult.accessToken?.tokenString}');

  //   // GoRouter.of(context).push(
  //   //   AppRouter.kBottomNavigationPage,
  //   // );

  //   //igned in, return the UserCredential
  //   UserCredential userCredential = await FirebaseAuth.instance
  //       .signInWithCredential(facebookAuthCredential);

  //   log(userCredential.additionalUserInfo!.username.toString());
  //   log(userCredential.user!.email.toString());
  //   log(userCredential.user!.photoURL.toString());

  //   return userCredential;
  // }
}
