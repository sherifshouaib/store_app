import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/networking/data_repository_from_firestore.dart';
import 'package:store_app/features/home/presentation/manager/products_firestore_cubit/products_firestore_state.dart';

class ProductsFirestoreCubit extends Cubit<ProductsFirestoreState> {
  final DataRepositoryFirestore repository;

  ProductsFirestoreCubit(this.repository) : super(ProductsFirestoreInitial());

  Future<void> fetchProducts() async {
    emit(ProductsFirestoreLoading());

    try {
      final products = await repository.getProducts();
      emit(ProductsFirestoreSuccess(products));
    } catch (e) {
      emit(ProductsFirestoreFailure(e.toString()));
    }
  }



}