import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/utils/colors.dart';

import '../../../../../core/buttons/custom_elevated_button.dart';
import '../../../../../core/utils/function/show_snack_bar.dart';
import '../../../../../core/widgets/custom_form_text_field.dart';
import '../login_view.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  String? email;

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  resetPassword() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        });

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      if (!mounted) return;
      showSnackBar(context, 'Done - Please check ur email');

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginView()));
    } on FirebaseException {
      showSnackBar(context, "ERROR : Email Not found ");
    }

//stop indicator
    // if (!mounted) return;
    // showSnackBar(context, 'Done - Please check ur email');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(33),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter your email to reset your password',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              CustomFormTextField(
                onChanged: (data) {
                  email = data;
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
                height: 33,
              ),
              CustomElevatedButton(
                colorfill: TColor.primary,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    resetPassword();
                  } else {
                    showSnackBar(context, "ERROR");
                  }
                },
                text: 'Reset Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
