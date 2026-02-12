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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        switch (mObj["index"].toString()) {
          case "1":
            GoRouter.of(context).push(AppRouter.kMyCartView);

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const PaymentDetailsView()));

            break;

          case "2":
            GoRouter.of(context).push(AppRouter.kMyOrderView);

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const MyOrderView()));
            break;
          case "3":
            GoRouter.of(context).push(AppRouter.kNotificationsView);

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const NotificationsView()));

            break;
          case "4":
            GoRouter.of(context).push(AppRouter.kDarkAndLightModeView);

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const NotificationsView()));

            break;
          case "5":
            GoRouter.of(context).push(AppRouter.kInboxView);

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const InboxView()));
            break;
          case "6":
            GoRouter.of(context).push(AppRouter.kAboutUsView);

          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const AboutUsView()));

          case "7":
            final googleSignIn = GoogleSignIn();

            try {
              if (await googleSignIn.isSignedIn()) {
                await googleSignIn.disconnect();
              }

              await FirebaseAuth.instance.signOut();

              if (!context.mounted) return;

              GoRouter.of(context).go(AppRouter.kLoginView);
            } catch (e) {
              debugPrint('Logout error: $e');
            }
            break;
          // GoogleSignIn googleSignIn = GoogleSignIn();
          // googleSignIn.disconnect();
          // FirebaseAuth.instance.signOut();
          // GoRouter.of(context).pushReplacement(
          //   AppRouter.kLoginView,
          // );

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
