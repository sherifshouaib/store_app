import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:store_app/features/profile/data/repos/data_from_firestore.dart';

class PersonalInformation extends StatelessWidget {
  PersonalInformation({
    super.key,
  });

  final credential = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(11),
              ),
              child: const Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            'Email: ${credential!.email}     ',
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            // DateFormat("MMMM d, y").format(    credential!.metadata.creationTime    );
      
            'Created data:  ${DateFormat("MMMM d, y").format(credential!.metadata.creationTime!)}    ',
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            'Last Signed In: ${DateFormat("MMMM d, y").format(credential!.metadata.lastSignInTime!)}  ',
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          GetDataFromFirestore(documentId: credential!.uid),
        ],
      ),
    );
  }
}
