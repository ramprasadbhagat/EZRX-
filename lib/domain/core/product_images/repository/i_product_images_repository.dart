import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IProductImagesRepository {
  Future<Either<ApiFailure, List>> getProductImages({
    required List list,
  });
}
