import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/material/entities/price.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';

abstract class IMaterialPriceRepository {
  Future<Either<ApiFailure, Map<MaterialNumber, Price>>> getMaterialPrice({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required List<MaterialNumber> materialNumberList,
  });
}
