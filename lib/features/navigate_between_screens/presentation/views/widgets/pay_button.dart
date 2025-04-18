import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class PayButton extends StatelessWidget {
  const PayButton({
    super.key,
    required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
  
      padding: const EdgeInsets.only(top:4),
      child: ElevatedButton(
        
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(bTNpink),
          padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
          
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8))),
        ),
        child: Text(
          "Pay \$${price.floor()}",
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
