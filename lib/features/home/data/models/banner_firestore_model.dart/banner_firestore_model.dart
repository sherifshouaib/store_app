class BannerFirestoreModel {
  final List<String> banners;

  BannerFirestoreModel({required this.banners});

  factory BannerFirestoreModel.fromJson(Map<String, dynamic> json) {
    return BannerFirestoreModel(
      banners: List<String>.from(json['banners']),
    );
  }
}

// import 'package:equatable/equatable.dart';

// class BannerFirestoreModel extends Equatable {
//   final String id;
//   final String image;

//   const BannerFirestoreModel({
//     required this.id,
//     required this.image,
//   });

//   factory BannerFirestoreModel.fromJson(
//           Map<String, dynamic> json, String docId) =>
//       BannerFirestoreModel(
//         id: docId,
//         image: json['image'] as String,
//       );

//   // Map<String, dynamic> toJson() => {
//   //       'id': id,
//   //       'title': title,
//   //       'price': price,
//   //       'description': description,
//   //       'category': category,
//   //       'image': image,
//   //       'rating': rating.toJson(),
//   //     };

//   @override
//   List<Object?> get props {
//     return [
//       id,
//       image,
//     ];
//   }
// }
