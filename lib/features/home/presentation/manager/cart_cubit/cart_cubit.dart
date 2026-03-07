import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState()) {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        emit(const CartState()); // reset
      } else {
        loadCart();
      }
    });
  }

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String? get userId => _auth.currentUser?.uid;

  /// 🟢 إضافة منتج + تحديث Firestore
  Future<void> addProductToCart(Map<String, dynamic> product) async {
    final uid = userId;
    if (uid == null) return;
    emit(state.copyWith(isLoading: true));

    try {
      final updatedCart = List<Map<String, dynamic>>.from(state.cartProducts)
        ..add(product);

      final updatedPrice = state.totalPrice + (product['price'] as double);

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc('cartData')
          .update({
        'products': updatedCart,
        'totalPrice': updatedPrice.round(),
      });

      emit(state.copyWith(
        cartProducts: updatedCart,
        totalPrice: updatedPrice,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  /// 🔴 حذف منتج + تحديث Firestore
  Future<void> removeProductFromCart(Map<String, dynamic> product) async {
    final uid = userId;
    if (uid == null) return;
    emit(state.copyWith(isLoading: true));

    try {
      final updatedCart = List<Map<String, dynamic>>.from(state.cartProducts)
        ..remove(product);

      final updatedPrice = state.totalPrice - (product['price'] as double);

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc('cartData')
          .update({
        'products': updatedCart,
        'totalPrice': updatedPrice.round(),
      });

      emit(state.copyWith(
        cartProducts: updatedCart,
        totalPrice: updatedPrice,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  /// 📥 تحميل البيانات من Firestore عند بداية التشغيل
  Future<void> loadCart() async {
    final uid = userId;
    if (uid == null) {
      emit(const CartState());
      return;
    }
    emit(state.copyWith(isLoading: true));
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc('cartData')
          .get();

      //  await _firestore.collection('carts').doc(userId).get();
      if (snapshot.exists) {
        final data = snapshot.data()!;
        emit(state.copyWith(
          cartProducts: List<Map<String, dynamic>>.from(data['products']),
          totalPrice: (data['totalPrice'] as num).toDouble(),
          isLoading: false,
        ));
      } else {
        emit(const CartState()); // ✅ مهم جدًا
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
