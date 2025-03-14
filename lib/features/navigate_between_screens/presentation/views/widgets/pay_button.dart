import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../home/presentation/manager/counter_cubit/counter_cubit.dart';

class PayButton extends StatelessWidget {
  const PayButton({
    super.key,
    required this.carttt,
  });

  final CounterCubit carttt;

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
          "Pay \$${carttt.price}",
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
