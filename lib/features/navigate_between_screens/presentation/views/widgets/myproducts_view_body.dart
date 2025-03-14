import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/manager/counter_cubit/counter_cubit.dart';
import '../../../../home/presentation/views/widgets/custom_product.image.dart';
import 'pay_button.dart';

class MyproductsViewBody extends StatelessWidget {
  const MyproductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final carttt = BlocProvider.of<CounterCubit>(context);

    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: 370,
                child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: carttt.selectedProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(carttt.selectedProducts[index].title
                            .substring(0, 6)),
                        subtitle: Text(
                            carttt.selectedProducts[index].price.toString()),
                        leading: CustomProductImage(
                            product: carttt.selectedProducts[index],
                            heightt: 200,
                            widthh: 200),
                        trailing: IconButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .productsDecrement(
                                productPrice: carttt.selectedProducts[index].price,
                                product: carttt.selectedProducts[index],
                              );
                            },
                            icon: const Icon(Icons.remove)),
                      ),
                    );
                  },
                ),
              ),
            ),
            PayButton(carttt: carttt),
          ],
        );
      },
    );
  }
}
