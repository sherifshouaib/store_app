import 'package:equatable/equatable.dart';
import 'package:store_app/features/home/data/models/product_model_firestore/rating_firestore.dart';


class ProductFirestoreModel extends Equatable {
  final String id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const ProductFirestoreModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductFirestoreModel.fromJson(Map<String, dynamic> json  , String docId ) => ProductFirestoreModel(
        id: docId,
        title: json['title'] as String,
        price: (json['price'] as int).toDouble(),
        description: json['description'] as String,
        category: json['category'] as String,
        image: json['image'] as String,
        rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
      );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'title': title,
  //       'price': price,
  //       'description': description,
  //       'category': category,
  //       'image': image,
  //       'rating': rating.toJson(),
  //     };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      price,
      description,
      category,
      image,
      rating,
    ];
  }
}
