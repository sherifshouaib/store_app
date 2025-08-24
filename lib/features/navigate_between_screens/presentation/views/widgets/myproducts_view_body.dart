import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:store_app/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/presentation/manager/cart_cubit/cart_state.dart';

import '../../../../home/presentation/views/widgets/custom_product.image.dart';
import '../../../../home/presentation/views/widgets/custom_product_cart_image.dart';
import 'pay_button.dart';

class MyProductsViewBody extends StatelessWidget {
  const MyProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: 560,
                child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: state.cartProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    // final product =
                    //     ProductModel.fromJson(state.cartProducts[index]);

                    return Card(
                      key: Key(state.cartProducts[index]['id'].toString()),
                      child: ListTile(
                        title: Text(
                            state.cartProducts[index]['title'].substring(0, 6)),
                        subtitle:
                            Text(state.cartProducts[index]['price'].toString()),
                        leading: CustomProductCartImage(
                            productImage: state.cartProducts[index]['image'],
                            heightt: 200,
                            widthh: 200),
                        trailing: IconButton(
                            onPressed: () {
                              context.read<CartCubit>().removeProductFromCart(
                                  state.cartProducts[index]);

                              // context.read<CounterCubit>().productsDecrement(
                              //       productPrice:
                              //           state.selectedProducts[index].price,
                              //       product: state.selectedProducts[index],
                              //     );

                              // setState(() {
                              //   users.doc(credential.uid).update({
                              //     "titles": FieldValue.arrayRemove(
                              //         [data['titles'][index]]),
                              //   });
                              //   users.doc(credential.uid).update({
                              //     "images": FieldValue.arrayRemove(
                              //         data['images'][index])
                              //   });
                              //   users.doc(credential.uid).update({
                              //     "prices": FieldValue.arrayRemove(
                              //         data['prices'][index])
                              //   });
                              // });
                            },
                            icon: const Icon(Icons.remove)),
                      ),
                    );
                  },
                ),
              ),
            ),
            PayButton(price: state.totalPrice),
          ],
        );
      },
    );
  }
}
