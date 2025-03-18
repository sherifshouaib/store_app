import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        const Text(
          'Email:       ',
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        const Text(
          'Created data:     ',
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        const Text(
          'Last Signed In:   ',
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
