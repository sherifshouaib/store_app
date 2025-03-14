// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import 'notification_item.dart';

class NotificationsListView extends StatelessWidget {
   NotificationsListView({super.key});

  final List notificationArr = [
    {
      "title": "Your orders has been picked up",
      "time": "Now",
    },
    {
      "title": "Your order has been delivered",
      "time": "1 h ago",
    },
    {
      "title": "Your orders has been picked up",
      "time": "3 h ago",
    },
    {
      "title": "Your order has been delivered",
      "time": "5 h ago",
    },
    {
      "title": "Your orders has been picked up",
      "time": "05 Jun 2023",
    },
    {
      "title": "Your order has been delivered",
      "time": "05 Jun 2023",
    },
    {
      "title": "Your orders has been picked up",
      "time": "06 Jun 2023",
    },
    {
      "title": "Your order has been delivered",
      "time": "06 Jun 2023",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: notificationArr.length,
      separatorBuilder: ((context, index) => Divider(
            indent: 25,
            endIndent: 25,
            color: TColor.secondaryText.withOpacity(0.4),
            height: 1,
          )),
      itemBuilder: ((context, index) {
        var cObjj = notificationArr[index] as Map? ?? {};
        return NotificationItem(
          indexNotificationItem: index,
          cObj: cObjj,
        );
      }),
    );
  }
}
