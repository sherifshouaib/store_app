import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.textinput});
  final dynamic textinput;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$textinput',
      style: const TextStyle(
        fontSize: 17,
        color: Colors.black,
      ),
    );
  }
}
