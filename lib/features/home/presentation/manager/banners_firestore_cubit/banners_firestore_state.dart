import 'package:equatable/equatable.dart';
import 'package:store_app/features/home/data/models/banner_firestore_model.dart/banner_firestore_model.dart';

abstract class BannersFirestoreState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BannersFirestoreInitial extends BannersFirestoreState {}

class BannersFirestoreLoading extends BannersFirestoreState {}

class BannersFirestoreSuccess extends BannersFirestoreState {
  final List<String> banners;

  BannersFirestoreSuccess(this.banners);

  @override
  List<Object?> get props => [banners];
}

class BannersFirestoreFailure extends BannersFirestoreState {
  final String errmessage;

  BannersFirestoreFailure(this.errmessage);

  @override
  List<Object?> get props => [errmessage];
}
