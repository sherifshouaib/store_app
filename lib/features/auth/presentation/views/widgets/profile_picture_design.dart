import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/features/auth/presentation/views/widgets/profile_picture.empty.dart';
import 'package:store_app/features/auth/presentation/views/widgets/profile_picture_filled.dart';

class ProfilePictureDesign extends StatefulWidget {
  const ProfilePictureDesign({super.key});

  @override
  State<ProfilePictureDesign> createState() => _ProfilePictureDesignState();
}

class _ProfilePictureDesignState extends State<ProfilePictureDesign> {
  File? imgPath;

  uploadImage2Screen(ImageSource sourcee) async {
    // FilePickerResult? result = await FilePicker.platform.pickFiles();

    // if (result != null) {
    //   File file = File(result.files.single.path!);
    // } else {
    //   // User canceled the picker
    // }

    final pickedImg = await ImagePicker().pickImage(source: sourcee);

    try {
      if (pickedImg != null) {
        print(File(pickedImg.path));
        return;
        // setState(() {
        //   imgPath = File(pickedImg.path);
        // });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }

    // Navigator.pop(context);
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
          imgPath == null
              ? const ProfilePictureEmpty()
              : ProfilePictureFilled(imgPath: imgPath),
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

  void _openFilePicker() async {
    FilePickerResult? _filePickerResult;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4'],
      type: FileType.custom,
    );

    setState(() {
      _filePickerResult = result;
    });

    GoRouter.of(context).pushNamed(
      AppRouter.kUploadArea,
      extra: _filePickerResult,
    );

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return const UploadArea();
    //     },
    //   ),
    // );

    // Navigator.pushNamed(context, '/upload', arguments: _filePickerResult);
  }
}
