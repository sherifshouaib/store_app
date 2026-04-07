import 'package:flutter/material.dart';

import 'facebook_sign_in_method.dart';
import 'google_sign_in_method.dart';

class SignInMethods extends StatelessWidget {
  const SignInMethods({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GoogleSignInMethod(),
        FacebookSignInMethod(),
      ],
    );
  }
}

