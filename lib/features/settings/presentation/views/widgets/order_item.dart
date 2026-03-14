import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.productName,
    required this.price,
    required this.status,
  });

  final String productName;
  final String price;
  final String status;

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
          const Icon(Icons.shopping_bag_outlined, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
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
