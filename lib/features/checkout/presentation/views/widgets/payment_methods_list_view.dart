import 'package:flutter/material.dart';

import 'payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});
  static int activeIndex = 0;

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
    'assets/images/master_card.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodsItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                PaymentMethodsListView.activeIndex = index;
                setState(() {});
              },
              child: PaymentMethodItem(
                image: paymentMethodsItems[index],
                isActive: PaymentMethodsListView.activeIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
