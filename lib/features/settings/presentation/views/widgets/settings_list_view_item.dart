import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store_app/core/routing/app_router.dart';

import 'ink_well_child.dart';

class SettingsListViewItem extends StatelessWidget {
  const SettingsListViewItem(
      {super.key, required this.mObj, required this.countBase});

  final Map mObj;
  final int countBase;
  static final googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        switch (mObj["index"].toString()) {
          case "1":
            GoRouter.of(context).push(AppRouter.kMyCartView);

            break;

          case "2":
            GoRouter.of(context).push(AppRouter.kMyOrderView);

            break;
          case "3":
            GoRouter.of(context).push(AppRouter.kNotificationsView);

            break;
          case "4":
            GoRouter.of(context).push(AppRouter.kDarkAndLightModeView);

            break;
          case "5":
            GoRouter.of(context).push(AppRouter.kInboxView);

            break;
          case "6":
            GoRouter.of(context).push(AppRouter.kAboutUsView);

          case "7":
            try {
              if (await googleSignIn.isSignedIn()) {
                await googleSignIn.signOut();
                // if (!context.mounted) return;

                // GoRouter.of(context).go(AppRouter.kLoginView);
              }

              await FirebaseAuth.instance.signOut();
            } catch (e) {
              debugPrint('Logout error: $e');
            }
            break;

          default:
        }
      },
      child: InkWellChild(
        mObj: mObj,
        countBase: countBase,
      ),
    );
  }
}
