import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:store_app/features/auth/presentation/views/widgets/profile_picture_filled.dart';
import 'package:path/path.dart' show basename;

class ProfilePictureDesign extends StatefulWidget {
  const ProfilePictureDesign({super.key, required this.optionn});
  static File? imgPath;
  static String? imgName;

  final Widget optionn;
  @override
  State<ProfilePictureDesign> createState() => _ProfilePictureDesignState();
}

class _ProfilePictureDesignState extends State<ProfilePictureDesign> {
  uploadImage2Screen(ImageSource sourcee) async {
    final pickedImg = await ImagePicker().pickImage(source: sourcee);

    try {
      if (pickedImg != null) {
        //   print(File(pickedImg.path));
        // return;
        setState(() {
          ProfilePictureDesign.imgPath = File(pickedImg.path);
          ProfilePictureDesign.imgName = basename(pickedImg.path);

          int random = Random().nextInt(9999999);
          ProfilePictureDesign.imgName =
              "$random${ProfilePictureDesign.imgName}";

          print(ProfilePictureDesign.imgName);
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
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
                  // final credential = FirebaseAuth.instance.currentUser;
                  // CollectionReference users =
                  //     FirebaseFirestore.instance.collection('usersss');

                  // users
                  //     .doc(credential.user!.uid)
                  //     .set({
                  //       'username': username,
                  //     })
                  //     .then((value) => print("User Added"))
                  //     .catchError(
                  //         (error) => print("Failed to add user: $error"));
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
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(125, 78, 91, 110),
      ),
      child: Stack(
        children: [
          ProfilePictureDesign.imgPath == null
              ? widget.optionn
              : ProfilePictureFilled(imgPath: ProfilePictureDesign.imgPath),
          Positioned(
            left: 99,
            bottom: -10,
            child: IconButton(
              onPressed: () {
                // uploadImage2Screen();
                showModel();

                //     _openFilePicker();
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
