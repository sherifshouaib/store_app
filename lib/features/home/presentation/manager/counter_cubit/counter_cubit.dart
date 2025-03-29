import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(0, []));

  // double? price;
  // List<ProductModel>? selectedProducts;
  void productsIncrement(
      {required double productPrice, required ProductModel product}) {
    final newSelectedProducts = List<ProductModel>.from(state.selectedProducts);
    newSelectedProducts.add(product);

    emit(state.copyWith(
        price: state.price + productPrice,
        selectedProducts: newSelectedProducts));

  }

  void productsDecrement(
      {required double productPrice, required ProductModel product}) {
    final newSelectedProducts = List<ProductModel>.from(state.selectedProducts);
    newSelectedProducts.remove(product);
    emit(state.copyWith(
        price: state.price - productPrice,
        selectedProducts: newSelectedProducts));
  }
}
