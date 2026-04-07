import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/manager/products_firestore_cubit/products_firestore_cubit.dart';
import 'package:store_app/features/home/presentation/manager/products_firestore_cubit/products_firestore_state.dart';
import 'package:store_app/features/home/presentation/views/widgets/custom_card.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_details_view_body.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import 'widgets/custom_row_appbar.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({
    super.key,
  });

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [CustomRowAppBar()],
      ),
      body: BlocBuilder<ProductsFirestoreCubit, ProductsFirestoreState>(
        builder: (context, state) {
          if (state is ProductsFirestoreSuccess) {
            return SafeArea(
              child: ProductDetailsViewBody(
                product:
                    state.products[CustomCard.indexxx],
              ),
            );
          } else if (state is ProductsFirestoreFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
