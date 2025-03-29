import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/counter_cubit/counter_cubit.dart';

class CustomRowAppbar extends StatelessWidget {
  const CustomRowAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        CollectionReference users =
            FirebaseFirestore.instance.collection('usersss');
        final credential = FirebaseAuth.instance.currentUser;
        int len = state.selectedProducts.length;

        // print(state.selectedProducts);
        users
            .doc(credential!.uid)
            .update({
              'price': state.price.floor(),
              'selectedProductslength': len,
            })
            .then((value) => print("data Added"))
            .catchError((error) => print("Failed to add data: $error"));

        return FutureBuilder<DocumentSnapshot>(
          future: users.doc(credential.uid).get(),
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

              return Row(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        bottom: 24,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(211, 164, 255, 193),
                              shape: BoxShape.circle),
                          child: Text(
                            "${data['selectedProductslength']}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_shopping_cart),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text("${data['price']}"),
                  )
                ],
              );
            }
            return const Text("");
          },
        );
      },
    );
  }
}
