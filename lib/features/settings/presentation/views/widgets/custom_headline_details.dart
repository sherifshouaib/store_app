import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class CustomHeadlineDetails extends StatelessWidget {
  const CustomHeadlineDetails({
    super.key,
    required this.txt2,
  });

  final String txt2;

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
                color: TColor.primary,
                borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              txt2,
              style:
                  const TextStyle(color: TColor.primaryText, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
