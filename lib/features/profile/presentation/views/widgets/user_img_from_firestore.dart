import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/views/widgets/profile_picture_empty.dart';

import '../../../../auth/presentation/views/widgets/profile_picture_image_user.dart';

class ImgUser extends StatefulWidget {
  const ImgUser({super.key});

  @override
  State<ImgUser> createState() => _ImgUserState();
}

class _ImgUserState extends State<ImgUser> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    final credential = FirebaseAuth.instance.currentUser;

    if (credential == null) {
      return const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person, size: 50),
      ); // لو المستخدم logout أو null
    }

    return StreamBuilder<DocumentSnapshot>(
      stream: users
          .doc(credential.uid)
          .collection('user')
          .doc('userData')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 50),
          );
        }

        Map<String, dynamic>? data =
            snapshot.data!.data() as Map<String, dynamic>?;

        String? imgLink = data?['imgLink'];

        if (imgLink == null || imgLink.isEmpty) {
          return const ProfilePictureEmpty();
        }

        return ProfilePictureImageUser(imageLink: imgLink);
      },
    );
  }
}
