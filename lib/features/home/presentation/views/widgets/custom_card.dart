import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/app_router.dart';
import 'package:store_app/features/home/data/models/product_model_firestore/product_firestore_model.dart';

import '../../manager/cart_cubit/cart_cubit.dart';
import 'custom_product.image.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.indexx,
    required this.product,
  });

  final ProductFirestoreModel product;
  final int indexx;
  static int indexxx = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                          r"$" "${product.price.round().toString()}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<CartCubit>().addProductToCart({
                              'id': product.id,
                              'title': product.title,
                              'price': product.price,
                              'image': product.image,
                            });
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
    );
  }
}
