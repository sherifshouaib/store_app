import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/networking/api_service.dart';
import 'package:store_app/core/networking/data_repository_from_firestore.dart';
import 'package:store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:store_app/features/home/presentation/manager/products_firestore_cubit/products_firestore_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton(
    () => DataRepositoryFirestore(
      firestore: getIt<FirebaseFirestore>(),
    ),
  );

  getIt.registerFactory<ProductsFirestoreCubit>(
    () => ProductsFirestoreCubit(
      getIt<DataRepositoryFirestore>(),
    ),
  );

  // getIt.registerFactory<BannersFirestoreCubit>(
  //   () => BannersFirestoreCubit(
  //     getIt<DataRepositoryFirestore>(),
  //   ),
  // );
}
