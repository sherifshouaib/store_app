import 'package:flutter/material.dart';

import '../about_us_view.dart';
import '../inbox_view.dart';
import '../my_order_view.dart';
import '../notifications_view.dart';
import '../payment_details_view.dart';
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaymentDetailsView()));

            break;

          case "2":
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyOrderView()));
          case "3":
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsView()));
          case "4":
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InboxView()));
          case "5":
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUsView()));
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
