import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/custom_error_widget.dart';
import 'package:store_app/core/widgets/custom_loading_indicator.dart';
import 'package:store_app/features/home/data/models/product_model_firestore/product_firestore_model.dart';
import 'package:store_app/features/home/presentation/manager/products_firestore_cubit/products_firestore_cubit.dart';
import 'package:store_app/features/home/presentation/manager/products_firestore_cubit/products_firestore_state.dart';
import 'package:store_app/features/home/presentation/views/widgets/special_banners.dart';

import 'custom_card.dart';

class HomeviewBody extends StatelessWidget {
  const HomeviewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: SpecialBanners()), // هنا حطيتها فوق المنتجات
          SliverToBoxAdapter(
              child: const SizedBox(
                  height: 80)), // مسافة بسيطة بين البانر والمنتجات

          BlocBuilder<ProductsFirestoreCubit, ProductsFirestoreState>(
            builder: (context, state) {
              if (state is ProductsFirestoreSuccess) {
                List<ProductFirestoreModel> products = state.products;
                // debugPrint(state.products.length);

                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return CustomCard(
                        product: products[index],
                        indexx: index,
                      );
                    },
                    childCount: products.length,
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: true,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                );

                //   itemCount: state.products.length,
                //   physics: const BouncingScrollPhysics(),
                //   clipBehavior: Clip.none,
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     childAspectRatio: 1.5,
                //     crossAxisSpacing: 10,
                //     mainAxisSpacing: 100,
                //   ),
                //   itemBuilder: (context, index) {
                //     return CustomCard(
                //       product: products[index],
                //       indexx: index,
                //     );
                //   },
                // );
              } else if (state is ProductsFirestoreFailure) {
                return SliverToBoxAdapter(
                    child: CustomErrorWidget(errMessage: state.errMessage));
              } else {
                return const SliverToBoxAdapter(
                    child: CustomLoadingIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
