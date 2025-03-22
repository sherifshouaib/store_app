import 'package:flutter/material.dart';

class DeveloperName extends StatelessWidget {
  const DeveloperName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: const Text(
        "Developed by Sherif Shouaib ©2025",
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
