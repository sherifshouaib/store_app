import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'order_info_items.dart';
import 'total_price_widget.dart';

class DataCartViewFromFireStore extends StatelessWidget {
  const DataCartViewFromFireStore({super.key});

  @override
  Widget build(BuildContext context) {
    final credential = FirebaseAuth.instance.currentUser;
    CollectionReference users =
        FirebaseFirestore.instance.collection('usersss');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(credential!.uid).get(),
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

          final String subTotal = "${(data['price']).round().toString()}\$";
          //    final double price = data['price'] ?? 0;

          final num rawPrice = data['price'] ?? 0; // يقبل int أو double
          final double price = rawPrice.toDouble();
          final String total =
              price == 0 ? "0" : "\$${(price + 8).round().toString()}";

          return Column(
            children: [
              OrderInfoItems(
                subTotal: subTotal,
              ),
              const SizedBox(
                width: 25,
              ),
              const Divider(
                thickness: 2,
                height: 34,
                color: Color(0xffC7C7C7),
              ),
              TotalPrice(title: 'Total', value: total),
            ],
          );
        }
        return const Text("loading");
      },
    );
  }
}
