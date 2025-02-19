import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product_model/product_model.dart';

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({
    super.key,
    required this.product,
    required this.heightt,
    required this.widthh,
  });

  final ProductModel product;
  final double heightt, widthh;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        height: heightt,
        width: widthh,
        imageUrl: product.image,
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.black,
        ),
      ),
    );
  }
}
