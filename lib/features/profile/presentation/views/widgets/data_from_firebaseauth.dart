import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:store_app/core/routing/app_router.dart';
import 'package:store_app/core/widgets/custom_text.dart';

import '../../../../../core/buttons/custom_text_button.dart';

class GetDataFromFirebaseAuth extends StatefulWidget {
  const GetDataFromFirebaseAuth({super.key});

  @override
  State<GetDataFromFirebaseAuth> createState() =>
      _GetDataFromFirebaseAuthState();
}

class _GetDataFromFirebaseAuthState extends State<GetDataFromFirebaseAuth> {
  Future<void> deleteUserData(String uid) async {
    final firestore = FirebaseFirestore.instance;

    final cartCollection =
        firestore.collection('users').doc(uid).collection('cart');

    final userCollection =
        firestore.collection('users').doc(uid).collection('user');

    final orderCollection =
        firestore.collection('users').doc(uid).collection('order');

    // delete cart docs
    final cartDocs = await cartCollection.get();
    for (var doc in cartDocs.docs) {
      await doc.reference.delete();
    }

    // delete user docs
    final userDocs = await userCollection.get();
    for (var doc in userDocs.docs) {
      await doc.reference.delete();
    }

    // delete order docs
    final orderDocs = await orderCollection.get();
    for (var doc in orderDocs.docs) {
      await doc.reference.delete();
    }

    // delete main document
    await firestore.collection('users').doc(uid).delete();
  }

  Future<void> deleteProfileImage(String uid) async {
    try {
      final ref = FirebaseStorage.instance.ref("users-images/$uid");
      await ref.delete();

      debugPrint("Profile image deleted successfully");
    } catch (e) {
      debugPrint("Image not found or already deleted");
    }
  }

  @override
  Widget build(BuildContext context) {
    final credential = FirebaseAuth.instance.currentUser;
    if (credential == null) {
      return Center(child: Text("User not logged in"));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 11,
        ),
        CustomText(textinput: 'Email: ${credential.email}'),
        const SizedBox(
          height: 11,
        ),
        CustomText(
            textinput: 'Created data:  ${DateFormat("MMMM d, y").format(
          credential!.metadata.creationTime!,
        )}'),
        const SizedBox(
          height: 11,
        ),
        CustomText(
          textinput:
              'Last Signed In: ${DateFormat("MMMM d, y").format(credential.metadata.lastSignInTime!)}',
        ),
        const SizedBox(
          height: 22,
        ),
        Center(
          child: CustomTextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              if (user == null) return; // آمن لو logout قبل ما يضغط

              // CollectionReference users =
              //     FirebaseFirestore.instance.collection('users');

              try {
                // ✅ 1. امسح صورة البروفايل من Storage
                await deleteProfileImage(user.uid);

                //  await users.doc(user.uid).delete();
                await deleteUserData(user.uid);

                await user.delete();

                if (!mounted) return;
                GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
              } catch (e) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Failed to delete account: $e")),
                );
              }
            },
            text2: 'Delete Account',
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
