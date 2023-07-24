import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';

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

  Future<Either<ApiFailure, SavedOrder>> createDraftOrder({
    required ShipToInfo shipToInfo,
    required User user,
    required List<CartItem> cartItems,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required DeliveryInfoData data,
  });

  Future<Either<ApiFailure, SubmitOrderResponse>> submitOrder({
    required ShipToInfo shipToInfo,
    required User user,
    required List<PriceAggregate> cartProducts,
    required double grandTotal,
    required double orderValue,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required DeliveryInfoData data,
    required OrderDocumentType orderDocumentType,
    required SalesOrganisationConfigs configs,
  });

  Future<Either<ApiFailure, SavedOrder>> getSavedOrderDetail({
    required String orderId,
  });

  Future<Either<ApiFailure, SavedOrder>> updateDraftOrder({
    required ShipToInfo shipToInfo,
    required User user,
    required List<CartItem> cartItems,
    required double grandTotal,
    required String orderId,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required DeliveryInfoData data,
  });
}
