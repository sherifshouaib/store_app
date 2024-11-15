import 'package:flutter/material.dart';



class CustomRowSign extends StatelessWidget {
  const CustomRowSign({
    super.key,
    required this.text1,
    required this.text2,
    required this.specificclass,
    
  });

  final String text1;
  final String text2;
  final Widget specificclass;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 18),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => specificclass,
              ),
            );
          },
          child: Text(
            text2,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        )
      ],
    );
  }
}
