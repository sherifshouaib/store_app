import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDataFromFirestore extends StatelessWidget {
  final String documentId;

  const GetDataFromFirestore({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usersss');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 22,
              ),
              Text(
                "Username: ${data['username']}",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                "Age: ${data['age']} years old",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                "Title: ${data['title']}",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                "Email: ${data['email']}",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                "Password: ${data['pass']}",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
              const SizedBox(
                height: 22,
              ),
            ],
          );
        }

        return const Text("loading");
      },
    );
  }
}
