import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/buttons/custom_text_button.dart';
import 'package:store_app/features/profile/presentation/views/widgets/data_edit_and_delete.dart';

class GetDataFromFirestore extends StatefulWidget {
  final String documentId;

  const GetDataFromFirestore({super.key, required this.documentId});

  @override
  State<GetDataFromFirestore> createState() => _GetDataFromFirestoreState();
}

class _GetDataFromFirestoreState extends State<GetDataFromFirestore> {
  final dialogUsernameController = TextEditingController();
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('usersss');

  myDialog(Map data, dynamic myKey) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Container(
            padding: const EdgeInsets.all(22),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: dialogUsernameController,
                  maxLength: 20,
                  decoration: InputDecoration(
                    hintText: '${data[myKey]}',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        //  addnewtask();
                        users
                            .doc(credential!.uid)
                            .update({myKey: dialogUsernameController.text});
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //  addnewtask();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usersss');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text(
            "Document does not exist",
            style: TextStyle(color: Colors.red),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          List<String> dataList = [
            data['username'] ?? 'please add username',
            data['age'] ?? 'please add age',
            data['title'] ?? 'please add title',
            data['email'] ?? 'please add email',
            data['pass'] ?? 'please add password',
          ];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 22,
              ),
              DataEditAndDelete(
                text1: "Username: ${dataList[0]}",
                onPressed1: () {
                  setState(() {
                    users
                        .doc(credential!.uid)
                        .update({"username": FieldValue.delete()});
                  });
                },
                onPressed2: () {
                  myDialog(data, 'username');
                },
              ),
              const SizedBox(
                height: 22,
              ),
              DataEditAndDelete(
                text1: "Age: ${dataList[1]}",
                onPressed1: () {
                  setState(() {
                    users
                        .doc(credential!.uid)
                        .update({"age": FieldValue.delete()});
                  });
                },
                onPressed2: () {
                  myDialog(data, 'age');
                },
              ),
              const SizedBox(
                height: 22,
              ),
              DataEditAndDelete(
                text1: "Title: ${dataList[2]}",
                onPressed1: () {
                  setState(() {
                    users
                        .doc(credential!.uid)
                        .update({"title": FieldValue.delete()});
                  });
                },
                onPressed2: () {
                  myDialog(data, 'title');
                },
              ),
              const SizedBox(
                height: 22,
              ),
              DataEditAndDelete(
                text1: "Email: ${dataList[3]}",
                onPressed1: () {
                  setState(() {
                    users
                        .doc(credential!.uid)
                        .update({"email": FieldValue.delete()});
                  });
                },
                onPressed2: () {
                  myDialog(data, 'email');
                },
              ),
              const SizedBox(
                height: 22,
              ),
              DataEditAndDelete(
                text1: "Password: ${dataList[4]}",
                onPressed1: () {
                  setState(() {
                    users
                        .doc(credential!.uid)
                        .update({"pass": FieldValue.delete()});
                  });
                },
                onPressed2: () {
                  myDialog(data, 'pass');
                },
              ),
              const SizedBox(
                height: 22,
              ),
              Center(
                child: CustomTextButton(
                  onPressed: () {
                    setState(() {
                      users.doc(credential!.uid).delete();
                    });
                  },
                  text2: 'Delete Data',
                  fontSize: 18,
                ),
              ),
            ],
          );
        }

        return const Text("loading");
      },
    );
  }
}
