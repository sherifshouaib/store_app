import 'package:flutter/material.dart';

class PersonalInformationContainer extends StatelessWidget {
  const PersonalInformationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(11),
        ),
        child: const Text(
          'Personal Information',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
