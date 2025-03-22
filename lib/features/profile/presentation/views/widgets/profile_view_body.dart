import 'package:flutter/material.dart';
import 'package:store_app/features/profile/presentation/views/widgets/developer_name.dart';

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
        //  UserAccountDetails(),
        Padding(
          padding: const EdgeInsets.all(22),
          child: PersonalInformation(),
        ),
        const DeveloperName(),
      ],
    );
  }
}
