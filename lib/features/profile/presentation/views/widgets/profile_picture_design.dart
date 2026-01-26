import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:store_app/features/auth/presentation/views/widgets/profile_picture_filled.dart';
import 'package:path/path.dart' show basename;
import 'package:store_app/features/profile/presentation/views/widgets/user_img_from_firestore.dart';

class ProfilePictureDesign extends StatefulWidget {
  const ProfilePictureDesign({super.key});

  @override
  State<ProfilePictureDesign> createState() => _ProfilePictureDesignState();
}

class _ProfilePictureDesignState extends State<ProfilePictureDesign> {
  CollectionReference users = FirebaseFirestore.instance.collection('usersss');
  final credential = FirebaseAuth.instance.currentUser;

  File? imgPath;
  String? imgName;
  uploadImage2Screen(ImageSource sourcee) async {
    final pickedImg = await ImagePicker().pickImage(source: sourcee);

    try {
      if (pickedImg != null) {
        //   debugPrint(File(pickedImg.path));
        // return;
        setState(() {
          imgPath = File(pickedImg.path);
          imgName = basename(pickedImg.path);

          int random = Random().nextInt(9999999);
          imgName = "$random$imgName";

          debugPrint(imgName);
        });
      } else {
        //    showSnackBar(context, "NO img selected");

        debugPrint("NO img selected");
      }
    } catch (e) {
      //   showSnackBar(context, "Error => $e");

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

                  if (imgPath != null) {
                    // Upload image to firebase storage
                    debugPrint(
                        'hellllllllllllllllllllllllllllllllllllooooooooooooooooooooo');

                    final storageRef = FirebaseStorage.instance.ref(
                      "users-images/$imgName",
                    );
                    await storageRef.putFile(imgPath!);

                    //  debugPrint('helllllllooooo');

                    // Get img url
                    String url = await storageRef.getDownloadURL();

                    // Store img url in firestore[database]
                    users.doc(credential!.uid).update({"imgLink": url});
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
                    // Upload image to firebase storage
                    debugPrint(
                        'hellllllllllllllllllllllllllllllooooooooooooooooooooooooooo');
                  
                    final storageRef = FirebaseStorage.instance.ref(
                      "users-images/$imgName",
                    );
                    await storageRef.putFile(imgPath!);

                    // debugPrint('helllllllooooo');

                    // Get img url
                    String url = await storageRef.getDownloadURL();

                    // Store img url in firestore[database]
                    users.doc(credential!.uid).update({"imgLink": url});
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
              const SizedBox(height: 22),
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
          imgPath == null ? ImgUser() : ProfilePictureFilled(imgPath: imgPath),
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
