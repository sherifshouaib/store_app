import 'dart:io';

import 'package:flutter/material.dart';

class ProfilePictureFilled extends StatelessWidget {
  const ProfilePictureFilled({
    super.key,
    required this.imgPath,
  });

  final File? imgPath;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.file(
        imgPath!,
        width: 145,
        height: 145,
        fit: BoxFit.cover,
      ),
    );
  }
}
