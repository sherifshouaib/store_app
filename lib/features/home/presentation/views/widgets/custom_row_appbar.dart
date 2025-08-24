import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/presentation/manager/cart_cubit/cart_state.dart';

class CustomRowAppBar extends StatelessWidget {
  const CustomRowAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        // final double rowPrice = (data['price']);
        // final String selectedProductslength =
        //     (data['selectedProductslength']).toString();

        return Row(
          children: [
            Stack(
              children: [
                Positioned(
                  bottom: 24,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(211, 164, 255, 193),
                        shape: BoxShape.circle),
                    child: Text(
                      "${state.cartProducts.length}",
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_shopping_cart),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text("${state.totalPrice.round()}"),
            )
          ],
        );
      },
    );
  }
}
