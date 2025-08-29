import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomProductCartImage extends StatelessWidget {
  const CustomProductCartImage({
    super.key,
    required this.productImage,
    required this.heightt,
    required this.widthh,
  });

  final String productImage;
  final double heightt, widthh;
  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        height: heightt,
        width: widthh,
        imageUrl: productImage,
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.black,
        ),
      ),
    );
  }
}
