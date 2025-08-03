import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store_app/core/utils/app_router.dart';

class CustomTextButtonIcon extends StatelessWidget {
  const CustomTextButtonIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        GoogleSignIn googleSignIn = GoogleSignIn();
        googleSignIn.disconnect();
        await FirebaseAuth.instance.signOut();
        
        GoRouter.of(context).pushReplacement(
          AppRouter.kLoginView,
        );
      },
      label: const Text(
        'logout',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      icon: const Icon(
        Icons.logout,
        color: Colors.black,
      ),
    );
  }
}
