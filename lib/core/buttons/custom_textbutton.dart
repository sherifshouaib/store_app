import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){     
      

      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bTNgreen),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(12),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 19, color: Colors.white),
      ),
    );
  }
}
