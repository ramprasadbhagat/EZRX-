import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';

abstract class IOrderRepository {
  Future<Either<ApiFailure, List<SavedOrder>>> getSavedOrder({
    required User user,
    required SalesOrganisation salesOrg,
    required CustomerCodeInfo customerCode,
    required ShipToInfo shipToCode,
    required int pageSize,
    required int offset,
  });

  Future<Either<ApiFailure, List<SavedOrder>>> deleteSavedOrder({
    required SavedOrder orderItem,
    required List<SavedOrder> ordersList,
  });

  Future<Either<ApiFailure, bool>> createDraftOrder({
    required ShipToCodeState shipToCodeState,
    required UserState userState,
    required CartState cartState,
    required CustomerCodeState customerCodeState,
    required SalesOrgState salesOrgStateState,
  });
}
