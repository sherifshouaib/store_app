import 'package:flutter/material.dart';

import 'personal_information.dart';
import 'user_account_details.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         UserAccountDetails(),
         Padding(
          padding: const EdgeInsets.all(22),
          child: PersonalInformation(),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: const Text(
            "Developed by Sherif Shouaib © 2025",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
