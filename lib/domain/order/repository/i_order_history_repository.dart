import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IOrderHistoryRepository {
  Future<Either<ApiFailure, OrderHistory>> getOrderHistory({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required ShipToInfo shipTo,
    required DateTime fromDate,
    required DateTime toDate,
    required String orderBy,
    required String sort,
    required User user,
    required int pageSize,
    required int offset,
  });
}
