// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:store_app/core/networking/data_repository_from_firestore.dart';
// import 'package:store_app/features/home/presentation/manager/banners_firestore_cubit/banners_firestore_state.dart';

// class BannersFirestoreCubit extends Cubit<BannersFirestoreState> {
//   final DataRepositoryFirestore repository;

//   BannersFirestoreCubit(this.repository) : super(BannersFirestoreInitial());

//   Future<void> getBanners() async {
//     emit(BannersFirestoreLoading());

//     try {
//       final banners = await repository.getBanners();


//       emit(BannersFirestoreSuccess(banners));
//     } catch (e) {
//       emit(BannersFirestoreFailure(e.toString()));
//     }
//   }
// }
