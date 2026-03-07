import '../../../data/models/product_model_firestore/product_firestore_model.dart';

abstract class ProductsFirestoreState {}

class ProductsFirestoreInitial extends ProductsFirestoreState {}

class ProductsFirestoreLoading extends ProductsFirestoreState {}

class ProductsFirestoreSuccess extends ProductsFirestoreState {
  final List<ProductFirestoreModel> products;
  ProductsFirestoreSuccess(this.products);
}

class ProductsFirestoreFailure extends ProductsFirestoreState {
  final String errMessage;
  ProductsFirestoreFailure(this.errMessage);
}