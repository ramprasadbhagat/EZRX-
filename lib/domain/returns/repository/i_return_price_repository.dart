import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/returns/entities/return_price.dart';

import 'package:ezrxmobile/domain/returns/entities/return_item.dart';

abstract class IReturnPriceRepository {
  Future<Either<ApiFailure, Map<String, ReturnPrice>>> fetchReturnPrice({
    required SalesOrganisation salesOrg,
    required List<ReturnItem> returnItemsList,
  });
}
