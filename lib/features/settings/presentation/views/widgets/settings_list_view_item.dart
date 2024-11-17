import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_router.dart';

import 'ink_well_child.dart';

class SettingsListViewItem extends StatelessWidget {
  const SettingsListViewItem(
      {super.key, required this.mObj, required this.countBase});

  final Map mObj;
  final int countBase;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (mObj["index"].toString()) {
          case "1":
            GoRouter.of(context).push(AppRouter.kPaymentDetailsView);

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
            GoRouter.of(context).push(AppRouter.kInboxView);

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const InboxView()));
            break;
          case "5":
            GoRouter.of(context).push(AppRouter.kAboutUsView);

          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const AboutUsView()));

          // case "6":
          //   ServiceCall.logout();

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
