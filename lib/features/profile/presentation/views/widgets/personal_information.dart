import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/profile/presentation/views/widgets/data_from_firebaseauth.dart';
import 'package:store_app/features/profile/presentation/views/widgets/data_from_firestore.dart';

import 'personal_information_container.dart';

class PersonalInformation extends StatelessWidget {
  PersonalInformation({
    super.key,
  });
  final credential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PersonalInformationContainer(),
        const GetDataFromFirebaseAuth(),
        GetDataFromFirestore(documentId: credential!.uid),
      ],
    );
  }
}
