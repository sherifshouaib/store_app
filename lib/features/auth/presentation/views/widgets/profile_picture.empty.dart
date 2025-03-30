import 'package:flutter/material.dart';

class ProfilePictureEmpty extends StatelessWidget {
  const ProfilePictureEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Color.fromARGB(255, 225, 225, 225),
      radius: 77,
      backgroundImage: AssetImage('assets/images/avatar.png'),
    );
  }
}
