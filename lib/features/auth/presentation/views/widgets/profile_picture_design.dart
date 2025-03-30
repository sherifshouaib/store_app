import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:store_app/features/auth/presentation/views/widgets/profile_picture.empty.dart';
import 'package:store_app/features/auth/presentation/views/widgets/profile_picture_filled.dart';

class ProfilePictureDesign extends StatefulWidget {
  const ProfilePictureDesign({super.key});

  @override
  State<ProfilePictureDesign> createState() => _ProfilePictureDesignState();
}

class _ProfilePictureDesignState extends State<ProfilePictureDesign> {
  File? imgPath;

  uploadImage2Screen() async {
    final pickedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    try {
      if (pickedImg != null) {
        setState(() {
          imgPath = File(pickedImg.path);
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(125, 78, 91, 110),
      ),
      child: Stack(
        children: [
          imgPath == null
              ? const ProfilePictureEmpty()
              : ProfilePictureFilled(imgPath: imgPath),
          Positioned(
            left: 99,
            bottom: -10,
            child: IconButton(
              onPressed: () {
                uploadImage2Screen();
              },
              icon: const Icon(Icons.add_a_photo),
              color: const Color.fromARGB(255, 94, 115, 128),
            ),
          ),
        ],
      ),
    );
  }
}
