import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class ISalesDistrictRepository {
  Future<Either<ApiFailure, List<SalesDistrict>>> getSalesDistrictList();
}
