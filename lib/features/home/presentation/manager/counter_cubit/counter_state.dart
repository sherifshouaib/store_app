part of 'counter_cubit.dart';

class CounterState extends Equatable {
  const CounterState(this.price, this.selectedProducts);

  final double price;
  final List<ProductModel> selectedProducts;
  CounterState copyWith({
    double? price,
    List<ProductModel>? selectedProducts,
  }) {
    return CounterState(
      price ?? this.price,
      selectedProducts ?? this.selectedProducts,
    );
  }

  @override
  List<Object> get props => [price, selectedProducts];
}
