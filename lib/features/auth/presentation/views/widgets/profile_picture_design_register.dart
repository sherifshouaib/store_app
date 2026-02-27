import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:store_app/features/auth/presentation/views/widgets/profile_picture_filled.dart';
import 'package:path/path.dart' show basename;

import 'profile_picture_empty.dart';

class ProfilePictureDesignRegister extends StatefulWidget {
  const ProfilePictureDesignRegister({
    super.key,
  });
  static File? imgPath;
  static String? imgName;

  @override
  State<ProfilePictureDesignRegister> createState() =>
      _ProfilePictureDesignRegisterState();
}

class _ProfilePictureDesignRegisterState
    extends State<ProfilePictureDesignRegister> {
  CollectionReference users = FirebaseFirestore.instance.collection('userSSS');

  uploadImage2Screen(ImageSource sourcee) async {
    final pickedImg = await ImagePicker().pickImage(source: sourcee);

    try {
      if (pickedImg != null) {
        //   debugPrint(File(pickedImg.path));
        // return;
        setState(() {
          ProfilePictureDesignRegister.imgPath = File(pickedImg.path);
          ProfilePictureDesignRegister.imgName = basename(pickedImg.path);

          int random = Random().nextInt(9999999);
          ProfilePictureDesignRegister.imgName =
              "$random${ProfilePictureDesignRegister.imgName}";

          debugPrint(ProfilePictureDesignRegister.imgName);
        });
      } else {
        debugPrint("NO img selected");
      }
    } catch (e) {
      debugPrint("Error => $e");
    }

    if (!mounted) return;
    Navigator.pop(context);
  }

  showModel() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
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
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.camera,
                      size: 30,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text('From Camera'),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () async {
                  await uploadImage2Screen(ImageSource.gallery);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.photo_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Text('From Gallery'),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
   // final user = FirebaseAuth.instance.currentUser;

    // if (user == null) {
    //   return const SizedBox(); // أو Container فاضي
    // }
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(125, 78, 91, 110),
      ),
      child: Stack(
        children: [
          ProfilePictureDesignRegister.imgPath == null
              ? ProfilePictureEmpty()
              : ProfilePictureFilled(
                  imgPath: ProfilePictureDesignRegister.imgPath),
          Positioned(
            left: 99,
            bottom: -10,
            child: IconButton(
              onPressed: () async {
                // uploadImage2Screen();
                await showModel();
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
