import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/buttons/custom_elevated_button.dart';
import 'package:store_app/core/buttons/custom_text_button.dart';
import 'package:store_app/features/navigate_between_screens/presentation/views/bottom_navigation_page_view.dart';

import '../../../../core/utils/function/show_snack_bar.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});
  static bool isEmailVerified = false;

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    VerifyEmailView.isEmailVerified =
        FirebaseAuth.instance.currentUser!.emailVerified;

    if (!VerifyEmailView.isEmailVerified) {
      sendVerificationEmail();


      timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
        // when we click on the link that existed on yahoo
        await FirebaseAuth.instance.currentUser!.reload();

        // is email verified or not (clicked on the link or not) (true or false)
        setState(() {
          VerifyEmailView.isEmailVerified =
              FirebaseAuth.instance.currentUser!.emailVerified;
        });

        if (VerifyEmailView.isEmailVerified) {
          timer.cancel();
        }
      });
    }
  }

  sendVerificationEmail() async {
    try {
      //await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      showSnackBar(context, "ERROR => ${e.toString()}");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VerifyEmailView.isEmailVerified
        ? const BottomNavigationPage()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Verify Email"),
              elevation: 0,
              // backgroundColor: appbarGreen,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "A verification email has been sent to your email",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      canResendEmail ? sendVerificationEmail() : null;
                    },
                    text: "Resend Email",
                    width: 140,
                    colorfill: Colors.redAccent,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  CustomTextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      text2: 'Cancel'),
                ],
              ),
            ),
          );
  }
}
