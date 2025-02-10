import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/core/utils/api_service.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:store_app/features/home/data/repos/home_repo.dart';

import '../../../../core/errors/failures.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      var data = await apiService.get(endPoint: 'products');

      List<ProductModel> products = [];

      for (int i = 0; i < data.length; i++) {
        products.add(
          ProductModel.fromJson(data[i]),
        );
      }
      return right(products);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<ProductModel>>> getProductDetails() async{
   
 try {
      var data = await apiService.get(endPoint: 'products');

      List<ProductModel> products = [];

      for (int i = 0; i < data.length; i++) {
        products.add(
          ProductModel.fromJson(data[i]),
        );
      }
      return right(products);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  
}
