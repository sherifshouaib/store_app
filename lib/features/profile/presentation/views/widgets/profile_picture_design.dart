import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_app/features/auth/presentation/views/widgets/profile_picture_filled.dart';
import 'package:store_app/features/profile/presentation/views/widgets/user_img_from_firestore.dart';

class ProfilePictureDesign extends StatefulWidget {
  const ProfilePictureDesign({super.key});

  @override
  State<ProfilePictureDesign> createState() => _ProfilePictureDesignState();
}

class _ProfilePictureDesignState extends State<ProfilePictureDesign> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  File? imgPath;
  // String? imgName;

  Future<void> uploadImage2Screen(ImageSource source) async {
    final pickedImg = await ImagePicker().pickImage(source: source);

    if (pickedImg == null) {
      debugPrint("No image selected");
      return;
    }

    setState(() {
      imgPath = File(pickedImg.path);
      // imgName = "${Random().nextInt(9999999)}${basename(pickedImg.path)}";
    });

    if (!mounted) return;
    Navigator.pop(context);
  }

  Future<void> _uploadToFirebase() async {
    final user = FirebaseAuth.instance.currentUser;

    // ✅ حماية كاملة من null بعد logout
    if (user == null || imgPath == null) {
      debugPrint("User null or image null");
      return;
    }

    try {
      final storageRef =
          FirebaseStorage.instance.ref("users-images/${user.uid}");
      await storageRef.putFile(imgPath!);

      final url = await storageRef.getDownloadURL();

      // ✅ 5. حدث Firestore
      await users.doc(user.uid).collection('user').doc('userData').set({
        "imgLink": url,
      }, SetOptions(merge: true));

      debugPrint("Image uploaded successfully");
    } catch (e) {
      debugPrint("Upload error: $e");
    }
  }

  void showModel() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(22),
          height: 170,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  await uploadImage2Screen(ImageSource.camera);
                  if (imgPath != null) {
                    await _uploadToFirebase();
                  }
                },
                child: const Row(
                  children: [
                    Icon(Icons.camera, size: 30),
                    SizedBox(width: 11),
                    Text('From Camera'),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              GestureDetector(
                onTap: () async {
                  await uploadImage2Screen(ImageSource.gallery);
                  if (imgPath != null) {
                    await _uploadToFirebase();
                  }
                },
                child: const Row(
                  children: [
                    Icon(Icons.photo_outlined, size: 30),
                    SizedBox(width: 11),
                    Text('From Gallery'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
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
              ? const ImgUser()
              : ProfilePictureFilled(
                  imgPath: imgPath,
                ),
          Positioned(
            left: 99,
            bottom: -10,
            child: IconButton(
              onPressed: showModel,
              icon: const Icon(Icons.add_a_photo),
              color: const Color.fromARGB(255, 94, 115, 128),
            ),
          ),
        ],
      ),
    );
  }
}
