import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/facebook_sign_in_cubit/facebook_sign_in_cubit.dart';
import '../../manager/cubits/google_sign_in_cubit/google_sign_in_cubit.dart';
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

