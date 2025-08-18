import 'package:flutter/material.dart';
import 'package:store_app/features/checkout/presentation/views/widgets/order_info_item.dart';

class OrderInfoItems extends StatelessWidget {
  const OrderInfoItems({super.key, required this.subTotal});

  final String subTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderInfoItem(
          title: 'Order Subtotal',
          value: subTotal,
        ),
        SizedBox(
          height: 3,
        ),
        OrderInfoItem(
          title: 'Discount',
          value: r'0$',
        ),
        SizedBox(
          height: 3,
        ),
        OrderInfoItem(
          title: 'Shipping',
          value: r'8$',
        ),
      ],
    );
  }
}
