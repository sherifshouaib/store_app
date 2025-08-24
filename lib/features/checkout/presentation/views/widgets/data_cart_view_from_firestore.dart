import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/manager/cart_cubit/cart_cubit.dart';
import '../../../../home/presentation/manager/cart_cubit/cart_state.dart';
import 'order_info_items.dart';
import 'total_price_widget.dart';

class DataCartViewFromFireStore extends StatelessWidget {
  const DataCartViewFromFireStore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final String subTotal = "${(state.totalPrice.round().toString())}\$";

        //  final num rawPrice = state.totalPrice ?? 0; // يقبل int أو double
        final double price = state.totalPrice.roundToDouble();
        final String total =
            price == 0 ? "0" : "\$${(price + 8).round().toString()}";

        return Column(
          children: [
            OrderInfoItems(
              subTotal: subTotal,
            ),
            const SizedBox(
              width: 25,
            ),
            const Divider(
              thickness: 2,
              height: 34,
              color: Color(0xffC7C7C7),
            ),
            TotalPrice(title: 'Total', value: total),
          ],
        );
      },
    );
  }
}
