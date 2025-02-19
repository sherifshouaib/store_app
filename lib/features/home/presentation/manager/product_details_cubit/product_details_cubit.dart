import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';

import '../../../data/repos/home_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.homeRepo) : super(ProductDetailsInitial());

  final HomeRepo homeRepo;

  Future<void> getProductDetails({required int productNo}) async {
    emit(ProductDetailsLoading());

    var result = await homeRepo.getProductDetails(productNo: productNo);

    result.fold((failure) {
      emit(ProductDetailsFailure(failure.errMessage));
    }, (products) {
      emit(ProductDetailsSuccess(products));
    });
  }
}
