import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class UpperBodyLoginReg extends StatelessWidget {
  const UpperBodyLoginReg({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          AssetsData.logo,
          height: 150,
        ),
        const Text(
          'AMAZON',
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontFamily: 'PassionOne-Black',
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
