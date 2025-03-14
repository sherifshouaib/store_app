import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  double price = 0;
  List selectedProducts = [];

  void productsIncrement(
      {required double productPrice, required ProductModel product}) {
    price += productPrice.round();
    selectedProducts.add(product);
    emit(CounterIncrement());

    print(price);
    print(selectedProducts.length);
    //  // print(selectedProducts);
  }

  void productsDecrement(
      {required double productPrice, required ProductModel product}) {
    price -= productPrice.round();
    selectedProducts.remove(product);

    emit(CounterDecrement());

    print(price);
    print(selectedProducts.length);
    //  // print(selectedProducts);
  }
}
