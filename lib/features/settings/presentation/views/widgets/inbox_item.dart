import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class InboxItem extends StatelessWidget {
  const InboxItem({
    super.key,
    required this.indexInboxItem,
    required this.cObj,
  });

  final int indexInboxItem;
  final Map<dynamic, dynamic> cObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: indexInboxItem % 4 != 1 ? TColor.white : TColor.textfield),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                color: TColor.primary, borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cObj["title"].toString(),
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  cObj["detail"].toString(),
                  maxLines: 2,
                  style: TextStyle(color: TColor.secondaryText, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
