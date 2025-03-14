import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class CustomMainHeadline extends StatelessWidget {
  const CustomMainHeadline({
    super.key,
 required this.txt1,
  });

  final String txt1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Text(
            txt1,
            style: const TextStyle(
                color: TColor.primaryText,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
