import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_app/features/home/data/models/banner_firestore_model.dart/banner_firestore_model.dart';
import 'package:store_app/features/home/data/models/product_model_firestore/product_firestore_model.dart';

class DataRepositoryFirestore {
  final FirebaseFirestore firestore;

  DataRepositoryFirestore({required this.firestore});

  Future<List<ProductFirestoreModel>> getProducts() async {
    final snapshot = await firestore.collection('products').get();

    return snapshot.docs.map((doc) {
      return ProductFirestoreModel.fromJson(doc.data(), doc.id);
    }).toList();
  }

  Future<List<String>> getBanners() async {
    try {
      final doc =
          await firestore.collection('banners').doc('special_banners').get();

      if (!doc.exists) {
        return [];
      }

      final data = doc.data();

      return List<String>.from(data?['banners'] ?? []);
    } catch (e) {
      return [];
    }
  }
}
