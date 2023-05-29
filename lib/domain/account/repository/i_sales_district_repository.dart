import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/add_sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

abstract class ISalesDistrictRepository {
  Future<Either<ApiFailure, List<SalesDistrict>>> getSalesDistrictList();

  Future<Either<ApiFailure, AddSalesDistrict>> addSalesDistrict({
    required SalesOrg salesOrg,
    required StringValue salesDistrictHeader,
    required StringValue salesDistrictLabel,
  });
}
