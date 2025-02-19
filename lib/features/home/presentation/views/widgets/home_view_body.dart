import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/custom_error_widget.dart';
import 'package:store_app/core/widgets/custom_loading_indicator.dart';
import 'package:store_app/features/home/presentation/manager/products_cubit/products_cubit.dart';

import '../../../data/models/product_model/product_model.dart';
import 'custom_card.dart';

class HomeviewBody extends StatelessWidget {
  const HomeviewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsSuccess) {
            List<ProductModel> products = state.products;
            // print(state.products.length);

            return GridView.builder(
              itemCount: state.products.length,
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 100,
              ),
              itemBuilder: (context, index) {
                return CustomCard(
                  product: state.products[index],
                  indexx: index,
                );
              },
            );
          } else if (state is ProductsFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
