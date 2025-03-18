

import 'package:flutter/material.dart';

class ORDivider extends StatelessWidget {
  const ORDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 299,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 0.6,
            ),
          ),
          Text(
            "OR",
            style: TextStyle(color: Colors.black),
          ),
          Expanded(
            child: Divider(
              thickness: 0.6,
            ),
          ),
        ],
      ),
    );
  }
}
