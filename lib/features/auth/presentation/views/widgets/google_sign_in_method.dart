import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/colors.dart';

import '../../manager/cubits/google_sign_in_cubit/google_sign_in_cubit.dart';

class GoogleSignInMethod extends StatelessWidget {
  const GoogleSignInMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 27, horizontal: 10),
      child: GestureDetector(
        onTap: () async {
          await BlocProvider.of<GoogleSignInCubit>(context).signInWithGoogle();
          // GoRouter.of(context).push(
          //   AppRouter.kBottomNavigationPage,
          // );
        },
        child: Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: const Color.fromARGB(255, 200, 67, 79), width: 1)),
          child: SvgPicture.asset(
            "assets/icons/icons8-google.svg",
            colorFilter: const ColorFilter.mode(
              TColor.svgColor2,
              BlendMode.srcIn,
            ),
            height: 27,
          ),
        ),
      ),
    );
  }
}
