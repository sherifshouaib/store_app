// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/features/auth/presentation/manager/blocs/auth_bloc/auth_bloc.dart';

import '../../../data/models/product_model/product_model.dart';
import '../../manager/counter_cubit/counter_cubit.dart';
import 'custom_product.image.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.indexx,
    required this.product,
  });

  ProductModel product;
  final int indexx;
  static int indexxx = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {},
      child: GestureDetector(
        onTap: () {
          CustomCard.indexxx = indexx;
          GoRouter.of(context).push(
            AppRouter.kProductDetailsView,
            // extra: ProductModel,
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: Colors.grey,
                    spreadRadius: 0,
                    offset: Offset(10, 10),
                  ),
                ],
              ),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.substring(0, 6),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r"$" "${product.price.toString()}",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<CounterCubit>().productsIncrement(
                                    productPrice: product.price,
                                    product: product,
                                  );

                              CollectionReference users = FirebaseFirestore
                                  .instance
                                  .collection('usersss');
                              final credential =
                                  FirebaseAuth.instance.currentUser;

                              BlocProvider.of<AuthBloc>(context)
                                  .prices
                                  .add(product.price);

                              BlocProvider.of<AuthBloc>(context)
                                  .titles
                                  .add(product.title);
                              BlocProvider.of<AuthBloc>(context)
                                  .images
                                  .add(product.image);
                              users
                                  .doc(credential!.uid)
                                  .update({
                                    'prices': BlocProvider.of<AuthBloc>(context)
                                        .prices,
                                    'titles': BlocProvider.of<AuthBloc>(context)
                                        .titles,
                                    'images': BlocProvider.of<AuthBloc>(context)
                                        .images,
                                  })
                                  .then((value) => print("data Added"))
                                  .catchError((error) =>
                                      print("Failed to add data: $error"));
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 32,
              top: -60,
              child: CustomProductImage(
                heightt: 100,
                widthh: 85,
                product: product,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
