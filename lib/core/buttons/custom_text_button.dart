import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text2,
    this.fontSize,
  });

  final void Function()? onPressed;
  final String text2;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text2,
        style: TextStyle(
          color: Colors.blue,
          fontSize: fontSize,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
