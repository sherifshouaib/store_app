import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.colorfill,
     this.width = double.infinity,
  });

  final String text;
  final Color colorfill;
  final VoidCallback? onPressed;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colorfill),
          padding: WidgetStateProperty.all(
            const EdgeInsets.all(12),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        child: Align(
          child: Text(
            text,
            style: const TextStyle(fontSize: 19, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
