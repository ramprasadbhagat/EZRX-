import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class ICustomerMaterialPriceDetailsRepository {
  Future<Either<ApiFailure, List<dynamic>>> getCustomerMaterialPriceDetails({
    required String customerCodeInfo,
    required String shipToInfo,
    required String salesOrganisation,
    required List<dynamic> request,
  });
}
