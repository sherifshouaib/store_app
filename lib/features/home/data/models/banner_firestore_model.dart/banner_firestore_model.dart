class BannerFirestoreModel {
  final List<String> banners;

  BannerFirestoreModel({required this.banners});

  factory BannerFirestoreModel.fromJson(Map<String, dynamic> json) {
    return BannerFirestoreModel(
      banners: List<String>.from(json['banners']),
    );
  }
}

