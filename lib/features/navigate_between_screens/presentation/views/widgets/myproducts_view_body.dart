import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/manager/counter_cubit/counter_cubit.dart';
import '../../../../home/presentation/views/widgets/custom_product.image.dart';
import 'pay_button.dart';

class MyProductsViewBody extends StatelessWidget {
  const MyProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: 560,
                child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: state.selectedProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      key: Key(state.selectedProducts[index].id.toString()),
                      child: ListTile(
                        title: Text(state.selectedProducts[index].title
                            .substring(0, 6)),
                        subtitle: Text(
                            state.selectedProducts[index].price.toString()),
                        leading: CustomProductImage(
                            product: state.selectedProducts[index],
                            heightt: 200,
                            widthh: 200),
                        trailing: IconButton(
                            onPressed: () {
                              context.read<CounterCubit>().productsDecrement(
                                    productPrice:
                                        state.selectedProducts[index].price,
                                    product: state.selectedProducts[index],
                                  );

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
            PayButton(price: state.price),
          ],
        );
      },
    );
  }
}
