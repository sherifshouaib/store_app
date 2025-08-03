import 'package:flutter/material.dart';

class DataEditAndDelete extends StatelessWidget {
  const DataEditAndDelete(
      {super.key, required this.text1, this.onPressed1, this.onPressed2});

  final String text1;
  final void Function()? onPressed1, onPressed2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: const TextStyle(color: Colors.black, fontSize: 13),
        ),
        Row(
          children: [
            IconButton(
              onPressed: onPressed1,
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: onPressed2,
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
