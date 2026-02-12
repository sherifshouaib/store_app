import 'package:flutter/material.dart';

import 'settings_list_view_item.dart';

class SettingsListView extends StatelessWidget {
  SettingsListView({super.key});

  final List moreArr = [
    {
      "index": "1",
      "name": "Payment Details",
      "image": "assets/images/settings_payment.png",
      "base": 0
    },
    {
      "index": "2",
      "name": "My Orders",
      "image": "assets/images/settings_my_order.png",
      "base": 0
    },
    {
      "index": "3",
      "name": "Notifications",
      "image": "assets/images/settings_notification.png",
      "base": 15
    },
     {
      "index": "4",
      "name": "Dart & Light mode",
      "image": "assets/images/dark-theme-svgrepo-com.svg",
      "base": -1
    },
    {
      "index": "5",
      "name": "Inbox",
      "image": "assets/images/settings_inbox.png",
      "base": 0
    },
    {
      "index": "6",
      "name": "About Us",
      "image": "assets/images/settings_info.png",
      "base": 0
    },
    {
      "index": "7",
      "name": "Logout",
      "image": "assets/images/settings_info.png",
      "base": 0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: moreArr.length,
      itemBuilder: (context, index) {
        var mObjj = moreArr[index] as Map? ?? {};
        var countBase = mObjj["base"] as int? ?? 0;

        return SettingsListViewItem(
          mObj: mObjj,
          countBase: countBase,
        );
      },
    );
  }
}
