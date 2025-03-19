import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/features/auth/presentation/manager/blocs/auth_bloc/auth_bloc.dart';
import 'package:store_app/features/auth/presentation/manager/cubits/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:store_app/features/auth/presentation/views/widgets/no_logic_part.dart';
import 'package:store_app/features/auth/presentation/views/widgets/upper_body_Login.dart';

import '../../../../../core/buttons/custom_elevated_button.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/function/show_snack_bar.dart';
import '../../../../../core/widgets/custom_form_text_field.dart';

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
    return BlocProvider(
      create: (context) => GoogleSignInCubit(),
      child: MultiBlocListener(
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
                    const NoLogicPart(),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 27),
                      child: GestureDetector(
                        onTap: () async {
                          await BlocProvider.of<GoogleSignInCubit>(context)
                              .signInWithGoogle(context);
                          // GoRouter.of(context).push(
                          //   AppRouter.kBottomNavigationPage,
                          // );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color.fromARGB(255, 200, 67, 79),
                                  width: 1)),
                          child: SvgPicture.asset(
                            "assets/icons/icons8-google.svg",
                            color: const Color.fromARGB(255, 200, 67, 79),
                            height: 27,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
}
