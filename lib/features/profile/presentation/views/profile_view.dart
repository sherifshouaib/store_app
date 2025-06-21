import 'package:flutter/material.dart';

import 'widgets/custom_text_button_icon.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CustomTextButtonIcon(),
        ],



        title: const Text('My Profile'),
      ),
     body: const ProfileViewBody(),
    );
  }
}
