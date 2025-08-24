import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

/// ميثود منفصلة تجيب بيانات المستخدم من Firestore
Future<Map<String, dynamic>?> getUserData() async {
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users =
      FirebaseFirestore.instance.collection('usersss');

  try {
    DocumentSnapshot doc = await users.doc(credential!.uid).get();
    if (doc.exists) {
      return doc.data() as Map<String, dynamic>;
    } else {
      return null; // لو الدوكيمونت مش موجود
    }
  } catch (e) {
    print("Error fetching user data: $e");
    return null;
  }
}

}
