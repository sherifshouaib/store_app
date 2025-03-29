import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/widgets/custom_text.dart';

import '../../../../../core/buttons/custom_text_button.dart';

class GetDataFromFirebaseAuth extends StatefulWidget {
  const GetDataFromFirebaseAuth({super.key});

  @override
  State<GetDataFromFirebaseAuth> createState() =>
      _GetDataFromFirebaseAuthState();
}

class _GetDataFromFirebaseAuthState extends State<GetDataFromFirebaseAuth> {
  final credential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 11,
        ),
        CustomText(textinput: 'Email: ${credential!.email}'),
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
              'Last Signed In: ${DateFormat("MMMM d, y").format(credential!.metadata.lastSignInTime!)}',
        ),
        const SizedBox(
          height: 22,
        ),
        Center(
          child: CustomTextButton(
            onPressed: () {
              setState(() {
                CollectionReference users =
                    FirebaseFirestore.instance.collection('usersss');

                credential!.delete();
                users.doc(credential!.uid).delete();

                GoRouter.of(context).pushReplacement(
                  AppRouter.kLoginView,
                );
              });
            },
            text2: 'Delete Account',
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
