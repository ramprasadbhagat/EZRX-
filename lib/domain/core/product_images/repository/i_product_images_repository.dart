import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class IProductImagesRepository {

  Future<Either<ApiFailure, Map<MaterialNumber, String>>>
      getImagesForMaterials({
    required List<MaterialNumber> list,
  });
}
