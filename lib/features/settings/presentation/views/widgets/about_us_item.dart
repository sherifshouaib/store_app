import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class AboutUsItem extends StatelessWidget {
  const AboutUsItem({
    super.key,
    required this.indexNotificationItem,
    required this.txt,
  });

  final int indexNotificationItem;
  final String txt;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
                color: TColor.primary, borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              txt,
              style: TextStyle(color: TColor.primaryText, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
