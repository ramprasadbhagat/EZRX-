import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/order/entities/price.dart';

abstract class IPriceOverrideRepository {
  Future<Either<ApiFailure, List<Price>>> updateItemPrice();
}
