import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

abstract class IDiscountOverrideRepository {
  Future<Either<ApiFailure, Price>> getMaterialPriceWithOverride({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required Price price,
  });

  Future<Either<ApiFailure, Price>> getMaterialPriceWithZdp5Discount({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Price price,
    required bool exceedQuantity,
  });
}
