import 'package:flutter/material.dart';
import 'package:store_app/core/utils/colors.dart';

import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: TColor.primary2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const ProfileViewBody(),
    );
  }
}
