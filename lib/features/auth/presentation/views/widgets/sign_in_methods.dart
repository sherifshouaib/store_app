import 'package:flutter/material.dart';

import 'facebook_sign_in_method.dart';
import 'google_sign_in_method.dart';

class SignInMethods extends StatelessWidget {
  const SignInMethods({
    super.key,
  });

  // Future<void Function()?> googleSignInOnTap(BuildContext context) async {
  //   await BlocProvider.of<GoogleSignInCubit>(context).signInWithGoogle(context);
  // }

  // Future<void Function()?> facebookSignInOnTap(BuildContext context) async {
  //   await BlocProvider.of<FacebookSignInCubit>(context)
  //       .signInWithFacebook(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        googleSignInMethod(),
        facebookSignInMethod(),
      ],
    );
  }
}

