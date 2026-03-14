import 'package:flutter/material.dart';

class MiddleTextView extends StatelessWidget {
  const MiddleTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Choose how your Amazooon experience looks for this device',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          'Dark Mode',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
