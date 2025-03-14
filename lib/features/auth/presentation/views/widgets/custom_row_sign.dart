import 'package:flutter/material.dart';

import '../../../../../core/buttons/custom_text_button.dart';

class CustomRowSign extends StatelessWidget {
  const CustomRowSign({
    super.key,
    required this.text1,
    required this.text2,
    required this.onPressed,
  });

  final String text1;
  final String text2;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(color: Colors.black),
        ),
        CustomTextButton(onPressed: onPressed, text2: text2),
      ],
    );
  }
}
