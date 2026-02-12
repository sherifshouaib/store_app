import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/buttons/custom_text_button.dart';
import '../../../../../core/routing/app_router.dart';
import 'custom_row_sign.dart';
import 'or_divider.dart';

class NoLogicPart extends StatelessWidget {
  const NoLogicPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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

        const ORDivider(),
      ],
    );
  }
}
