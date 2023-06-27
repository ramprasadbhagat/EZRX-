import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';

abstract class IViewByItemRepository {
  Future<Either<ApiFailure, OrderHistory>> getOrderHistory({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required ShipToInfo shipTo,
    required User user,
    required int pageSize,
    required int offset,
    required OrderHistoryFilter orderHistoryFilter,
  });
  Future<Either<ApiFailure, List<OrderHistoryItem>>> getItemProductDetails({
    required List<OrderHistoryItem> orderHistoryItem,
  });
}
