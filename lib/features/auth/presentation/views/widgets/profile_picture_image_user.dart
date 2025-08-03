import 'package:flutter/material.dart';

class ProfilePictureImageUser extends StatelessWidget {
  const ProfilePictureImageUser({
    required this.imageLink,
    super.key,
  });

  final String imageLink;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color.fromARGB(255, 225, 225, 225),
      radius: 77,
      backgroundImage: NetworkImage(imageLink),
    );
  }
}
