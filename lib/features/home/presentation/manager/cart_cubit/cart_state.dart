import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final List<Map<String, dynamic>> cartProducts;
  final double totalPrice;
  final bool isLoading;
  final String? errorMessage;

  const CartState({
    this.cartProducts = const [],
    this.totalPrice = 0.0,
    this.isLoading = false,
    this.errorMessage,
  });

  CartState copyWith({
    List<Map<String, dynamic>>? cartProducts,
    double? totalPrice,
    bool? isLoading,
    String? errorMessage,
  }) {
    return CartState(
      cartProducts: cartProducts ?? this.cartProducts,
      totalPrice: totalPrice ?? this.totalPrice,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [cartProducts, totalPrice, isLoading, errorMessage];
}
