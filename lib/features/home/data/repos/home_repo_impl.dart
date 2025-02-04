import 'package:dartz/dartz.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:store_app/features/home/data/repos/home_repo.dart';

import '../../../../core/errors/failures.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  
}