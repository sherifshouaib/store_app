import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/custom_card.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_details_view_body.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import 'widgets/custom_row_appbar.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({
    super.key,
    // required this.product,
    // required this.indexx,
  });

  // final ProductModel product;
  // final int indexx;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  void initState() {
    BlocProvider.of<ProductDetailsCubit>(context)
        .getProductDetails(productNo: CustomCard.indexxx + 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: appbarGreen,
        title: const Text("Product Details"),
        actions: const [CustomRowAppBar()],
      ),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsSuccess) {
            return SafeArea(
              child: ProductDetailsViewBody(
                product: state.products[0],
                // state.products[CustomCard.indexxx],
              ),
            );
          } else if (state is ProductDetailsFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
