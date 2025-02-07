import 'package:flutter/material.dart';

import '../../../data/models/product_model/product_model.dart';
import 'custom_product.image.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    super.key,
  });

  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                        onPressed: () {},
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
          child: CustomProductImage(product: product),
        ),
      ],
    );
  }
}
