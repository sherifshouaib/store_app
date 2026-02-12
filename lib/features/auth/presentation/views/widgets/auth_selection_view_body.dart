import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/buttons/custom_elevated_button.dart';
import 'package:store_app/core/utils/colors.dart';

import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/assets.dart';

class AuthSelectionViewBody extends StatelessWidget {
  const AuthSelectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            AssetsData.logo,
            height: 150,
          ),
          const Text(
            'AMAZON',
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontFamily: 'PassionOne-Black',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(
                AppRouter.kLoginView,
              );
            },
            text: "Login",
            colorfill: TColor.primary2,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(
                AppRouter.kRegisterView,
              );
            },
            text: 'Create an Account',
            colorfill: TColor.primary2,
          ),
        ],
      ),
    );
  }
}
