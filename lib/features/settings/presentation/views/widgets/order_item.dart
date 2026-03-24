import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/product_model_firestore/product_firestore_model.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.status,
    required this.product,
  });

  final String status;
  final ProductFirestoreModel product;

  Color getStatusColor() {
    if (status == "Delivered") {
      return Colors.green;
    } else {
      return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.grey.shade100,
      ),
      child: Row(
        children: [
          ClipRRect(
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
          ),
          //  const Icon(Icons.shopping_bag_outlined, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.price.toString(),
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 6),
                Text(
                  "Status: $status",
                  style: TextStyle(
                    color: getStatusColor(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
