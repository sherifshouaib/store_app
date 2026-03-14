import 'package:flutter/material.dart';
import 'package:store_app/core/utils/colors.dart';

class UpperBodyItem extends StatelessWidget {
  const UpperBodyItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
              Image.asset("assets/images/btn_back.png", width: 20, height: 20),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}
