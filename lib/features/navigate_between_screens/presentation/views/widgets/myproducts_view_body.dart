import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/manager/counter_cubit/counter_cubit.dart';
import '../../../../home/presentation/views/widgets/custom_product.image.dart';
import 'pay_button.dart';

class MyproductsViewBody extends StatefulWidget {
  const MyproductsViewBody({super.key});

  @override
  State<MyproductsViewBody> createState() => _MyproductsViewBodyState();
}

class _MyproductsViewBodyState extends State<MyproductsViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        CollectionReference users =
            FirebaseFirestore.instance.collection('usersss');
        final credential = FirebaseAuth.instance.currentUser;

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

              List<String> dataList = [
                data['username'] ?? 'please add username',
                data['age'] ?? 'please add age',
                data['title'] ?? 'please add title',
                data['email'] ?? 'please add email',
                data['pass'] ?? 'please add password',
              ];

              return Column(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 370,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(5),
                        itemCount: state.selectedProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            key: Key(
                                state.selectedProducts[index].id.toString()),
                            child: ListTile(
                              title: Text(state.selectedProducts[index].title
                                  .substring(0, 6)),
                              subtitle: Text(state.selectedProducts[index].price
                                  .toString()),
                              leading: CustomProductImage(
                                  product: state.selectedProducts[index],
                                  heightt: 200,
                                  widthh: 200),
                              trailing: IconButton(
                                  onPressed: () {
                                    context
                                        .read<CounterCubit>()
                                        .productsDecrement(
                                          productPrice: state
                                              .selectedProducts[index].price,
                                          product:
                                              state.selectedProducts[index],
                                        );

                                    // setState(() {
                                    //   users.doc(credential.uid).update({
                                    //     "titles": FieldValue.arrayRemove(
                                    //         [data['titles'][index]]),
                                    //   });
                                    //   users.doc(credential.uid).update({
                                    //     "images": FieldValue.arrayRemove(
                                    //         data['images'][index])
                                    //   });
                                    //   users.doc(credential.uid).update({
                                    //     "prices": FieldValue.arrayRemove(
                                    //         data['prices'][index])
                                    //   });
                                    // });
                                  },
                                  icon: const Icon(Icons.remove)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  PayButton(price: state.price),
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
