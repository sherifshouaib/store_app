import 'package:store_app/core/errors/failures.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, List<ProductModel>>> getProductDetails();
}
