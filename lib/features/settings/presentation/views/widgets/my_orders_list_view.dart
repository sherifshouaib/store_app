import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/custom_error_widget.dart';
import 'package:store_app/core/widgets/custom_loading_indicator.dart';
import 'package:store_app/features/home/data/models/product_model_firestore/product_firestore_model.dart';
import 'package:store_app/features/home/presentation/manager/products_firestore_cubit/products_firestore_cubit.dart';
import 'package:store_app/features/home/presentation/manager/products_firestore_cubit/products_firestore_state.dart';
import 'package:store_app/features/settings/presentation/views/widgets/order_item.dart';

class MyOrdersListView extends StatelessWidget {
  const MyOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsFirestoreCubit, ProductsFirestoreState>(
      builder: (context, state) {
        if (state is ProductsFirestoreSuccess) {
          List<ProductFirestoreModel> products = state.products;
          // debugPrint(state.products.length);

          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              OrderItem(
                product: products[1],
                status: "Picked Up",
              ),
              SizedBox(height: 12),
              OrderItem(
                product: products[11],
                status: "Delivered",
              ),
              SizedBox(height: 12),
              OrderItem(
                product: products[15],
                status: "Delivered",
              ),
              SizedBox(height: 12),
              OrderItem(
                product: products[17],
                status: "Picked Up",
              ),
            ],
          );
        } else if (state is ProductsFirestoreFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(errMessage: state.errMessage));
        } else {
          return const SliverToBoxAdapter(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
