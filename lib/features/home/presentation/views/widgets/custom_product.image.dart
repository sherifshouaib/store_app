import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product_model/product_model.dart';

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        height: 100,
        width: 85,
        imageUrl: product.image,
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.black,
        ),
      ),
    );
  }
}
