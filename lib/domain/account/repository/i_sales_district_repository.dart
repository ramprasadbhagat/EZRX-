import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/manage_sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class ISalesDistrictRepository {
  Future<Either<ApiFailure, List<SalesDistrict>>> getSalesDistrictList();

  Future<Either<ApiFailure, SalesDistrictResponseMessage>> addSalesDistrict({
    required SalesOrg salesOrg,
    required SalesDistrictInfo salesDistrictInfo,
  });

  Future<Either<ApiFailure, SalesDistrictResponseMessage>> editSalesDistrict({
    required SalesOrg salesOrg,
    required SalesDistrictInfo salesDistrictInfo,
  });

  Future<Either<ApiFailure, SalesDistrictResponseMessage>> deleteSalesDistrict({
    required int id,
  });
}
