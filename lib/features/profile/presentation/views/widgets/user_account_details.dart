import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/views/widgets/profile_picture_design.dart';

class UserAccountDetails extends StatelessWidget {
  UserAccountDetails({
    super.key,
  });

  final userrr = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/test.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      accountName: Text(
        userrr.displayName!,
        style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      accountEmail: Text(userrr.email!),
      currentAccountPicture: const ProfilePictureDesign(),
    );
  }
}
