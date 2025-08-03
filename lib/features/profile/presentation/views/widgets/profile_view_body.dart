import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/views/widgets/profile_picture_design.dart';
import 'package:store_app/features/profile/presentation/views/widgets/developer_name.dart';

import 'personal_information.dart';
import 'user_img_from_firestore.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // UserAccountDetails(),
          const SizedBox(
            height: 12,
          ),
          const ProfilePictureDesign(
            optionn: ImgUser(),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: PersonalInformation(),
          ),
          const DeveloperName(),
        ],
      ),
    );
  }
}
