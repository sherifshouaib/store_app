import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/auth/presentation/manager/blocs/auth_bloc/auth_bloc.dart';
import 'package:store_app/features/auth/presentation/views/widgets/custom_row_sign.dart';
import 'package:store_app/features/auth/presentation/views/widgets/profile_picture_design_register.dart';
import '../../../../../core/buttons/custom_elevated_button.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/function/show_snack_bar.dart';
import '../../../../../core/widgets/custom_form_text_field.dart';
import 'row_passwordauth.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String? email, password;
  bool isVisible = false;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  bool isPassword8Char = false;

  bool isPasswordHas1Number = false;

  bool hasUppercase = false;

  bool hasLowercase = false;

  bool hasSpecialCharacters = false;

  onPasswordChanged(String password) {
    isPassword8Char = false;
    isPasswordHas1Number = false;
    hasUppercase = false;
    hasLowercase = false;
    hasSpecialCharacters = false;

    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        isPassword8Char = true;
      }

      if (password.contains(RegExp(r'[0-9]'))) {
        isPasswordHas1Number = true;
      }

      if (password.contains(RegExp(r'[A-Z]'))) {
        hasUppercase = true;
      }

      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowercase = true;
      }
      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacters = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    email = BlocProvider.of<AuthBloc>(context).email;
    password = BlocProvider.of<AuthBloc>(context).password;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          // GoRouter.of(context).push(
          //   AppRouter.kHomeView,
          // );
          showSnackBar(context, state.succMessage);

          isLoading = false;
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    ProfilePictureDesignRegister(),

                    const SizedBox(
                      height: 80,
                    ),
                    const Row(
                      children: [
                        Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomFormTextField(
                      onChanged: (data) {
                        BlocProvider.of<AuthBloc>(context).username = data;
                      },
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'field is required';
                        }
                        return null;
                      },
                      texttype: TextInputType.text,
                      textfieldmessage: 'Username',
                      icon: const Icon(
                        Icons.person,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomFormTextField(
                      onChanged: (data) {
                        BlocProvider.of<AuthBloc>(context).age = data;
                      },
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'field is required';
                        }
                        return null;
                      },
                      texttype: TextInputType.number,
                      textfieldmessage: 'Age',
                      icon: const Icon(
                        Icons.watch_later,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomFormTextField(
                      onChanged: (data) {
                        BlocProvider.of<AuthBloc>(context).title = data;
                      },
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'field is required';
                        }
                        return null;
                      },
                      texttype: TextInputType.text,
                      textfieldmessage: 'Title',
                      icon: const Icon(Icons.person_outline),
                    ),

                    const SizedBox(
                      height: 8,
                    ),
                    CustomFormTextField(
                      onChanged: (data) {
                        BlocProvider.of<AuthBloc>(context).email = data;
                      },
                      validator: (data) {
                        return data!.contains(RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                            ? null
                            : 'Enter a valid email';
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
                      obscureText: isVisible ? false : true,
                      onChanged: (data) {
                        onPasswordChanged(data);

                        BlocProvider.of<AuthBloc>(context).password = data;
                      },
                      texttype: TextInputType.text,
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

                    RowPasswordauth(
                        rowPassMessage: 'At least 8 characters',
                        passAuth: isPassword8Char),
                    const SizedBox(
                      height: 10,
                    ),
                    RowPasswordauth(
                        rowPassMessage: 'At least 1 number',
                        passAuth: isPasswordHas1Number),
                    const SizedBox(
                      height: 10,
                    ),
                    RowPasswordauth(
                        rowPassMessage: 'Has Uppercase',
                        passAuth: hasUppercase),
                    const SizedBox(
                      height: 10,
                    ),
                    RowPasswordauth(
                        rowPassMessage: 'Has Lowercase',
                        passAuth: hasLowercase),
                    const SizedBox(
                      height: 10,
                    ),
                    RowPasswordauth(
                      rowPassMessage: 'Has Special Characters',
                      passAuth: hasSpecialCharacters,
                    ),

                    const SizedBox(
                      height: 22,
                    ),
                    CustomElevatedButton(
                      colorfill: TColor.primary2,
                      onPressed: () async {
                        await registerValidation(context);
                      },
                      text: 'Register',
                    ),

                    // CommonReglogBody(
                    //   textfield1message: 'Email',
                    //   textfield2message: 'Password',
                    //   buttonmessage: 'Register',
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
                          AppRouter.kLoginView,
                        );
                      },
                      text1: 'Already have an account ?',
                      text2: ' Login',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> registerValidation(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (isPassword8Char == false ||
          isPasswordHas1Number == false ||
          hasUppercase == false ||
          hasLowercase == false ||
          hasSpecialCharacters == false) {
        showSnackBar(context, 'weak password');
        return;
      }
      if (ProfilePictureDesignRegister.imgName == null ||
          ProfilePictureDesignRegister.imgPath == null) {
        showSnackBar(context, 'Upload Your Image');
        return;
      }

      isLoading = true;
      BlocProvider.of<AuthBloc>(context)
          .add(RegisterEvent(email: email!, password: password!));
      // try {
      //   await registerUser();
      //   showSnackBar(context, 'Success');
      //   // GoRouter.of(context).push(
      //   //   AppRouter.kLoginView,
      //   //   // extra: ProductModel,
      //   // );
      //   // Navigator.push(context, );
      // } on FirebaseAuthException catch (ex) {
      //   if (ex.code == 'weak-password') {
      //     showSnackBar(context, 'weak password');
      //   } else if (ex.code == 'email-already-in-use') {
      //     showSnackBar(context, 'email already exists');
      //   }
      // } catch (ex) {
      //   showSnackBar(context, 'there was an error');
      // }
      isLoading = false;
      debugPrint('$isLoading');
    } else {}
  }

  // Future<void> registerUser() async {
  //   UserCredential user = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email!, password: password!);
  // }
}
