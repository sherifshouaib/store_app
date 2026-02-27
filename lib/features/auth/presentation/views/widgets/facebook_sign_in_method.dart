import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/colors.dart';

import '../../manager/cubits/facebook_sign_in_cubit/facebook_sign_in_cubit.dart';

class FacebookSignInMethod extends StatelessWidget {
  const FacebookSignInMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 27),
      child: GestureDetector(
        onTap: () async {
          // await  signInWithFacebook(context);
          await BlocProvider.of<FacebookSignInCubit>(context)
              .signInWithFacebook();
          // GoRouter.of(context).push(
          //   AppRouter.kBottomNavigationPage,
          // );
        },
        child: Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: const Color.fromARGB(255, 67, 158, 200), width: 1)),
          child: SvgPicture.asset(
            "assets/icons/facebook.svg",
            colorFilter: const ColorFilter.mode(
              TColor.svgColor1,
              BlendMode.srcIn,
            ),
            height: 27,
          ),
        ),
      ),
    );
  }
}
