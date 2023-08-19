import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';

abstract class IViewByItemRepository {
  Future<Either<ApiFailure, OrderHistory>> getViewByItems({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required ShipToInfo shipTo,
    required User user,
    required int pageSize,
    required int offset,
    required ViewByItemFilter viewByItemFilter,
    required SearchKey searchKey,
  });
}
