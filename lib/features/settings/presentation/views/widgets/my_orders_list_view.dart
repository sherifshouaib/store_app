import 'package:flutter/material.dart';
import 'package:store_app/features/settings/presentation/views/widgets/order_item.dart';

class MyOrdersListView extends StatelessWidget {
  const MyOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        OrderItem(
          productName: "Cotton Short",
          price: "\$13",
          status: "Picked Up",
        ),
        SizedBox(height: 12),
        OrderItem(
          productName: "Micropave",
          price: "\$168",
          status: "Delivered",
        ),
        SizedBox(height: 12),
        OrderItem(
          productName: "Double Rings",
          price: "\$11",
          status: "Delivered",
        ),
        SizedBox(height: 12),
        OrderItem(
          productName: "External Hard Drive",
          price: "\$64",
          status: "Picked Up",
        ),
      ],
    );
  }
}
