import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
          color: Colors.white,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white,fontSize: 12),
        ),
      ],
    );
  }
}
