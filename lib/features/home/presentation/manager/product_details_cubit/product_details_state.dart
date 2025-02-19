part of 'product_details_cubit.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsFailure extends ProductDetailsState {
  final String errMessage;

  const ProductDetailsFailure(this.errMessage);
}

final class ProductDetailsSuccess extends ProductDetailsState {
  final List<ProductModel> products;

  const ProductDetailsSuccess(this.products);
}

final class ProductDetailsLoading extends ProductDetailsState {
  
}
