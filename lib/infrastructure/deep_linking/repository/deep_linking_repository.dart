import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';

class DeepLinkingRepository implements IDeepLinkingRepository {
  final Config config;
  final DeviceStorage deviceStorage;

  DeepLinkingRepository({
    required this.config,
    required this.deviceStorage,
  });

  @override
  Either<ApiFailure, MaterialNumber> extractMaterialNumber({
    required Uri link,
  }) {
    final materialNumber = MaterialNumber(link.pathSegments.lastOrNull ?? '');
    final isValidLink = _validDomain(link) && materialNumber.isValid();

    return isValidLink
        ? Right(materialNumber)
        : const Left(ApiFailure.productDetailRoute());
  }

  @override
  Either<ApiFailure, OrderNumber> extractOrderNumber({
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  }) {
    final customerCode = link.queryParameters['SoldTo'];
    final shipToCode = link.queryParameters['ShipTo'];
    final orderNumber = OrderNumber(link.queryParameters['orderNumber'] ?? '');
    final isValidLink = _validDomain(link) &&
        customerCode == selectedCustomerCode.customerCodeSoldTo &&
        shipToCode == selectedShipTo.shipToCustomerCode &&
        orderNumber.isValid();

    return isValidLink
        ? Right(orderNumber)
        : const Left(ApiFailure.orderDetailRoute());
  }

  @override
  Either<ApiFailure, ReturnRequestsId> extractReturnId({
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  }) {
    final customerCode = link.queryParameters['soldTo'];
    final shipToCode = link.queryParameters['shipTo'];
    final returnId =
        ReturnRequestsId(requestId: link.queryParameters['requestID'] ?? '');
    final isValidLink = _validDomain(link) &&
        customerCode == selectedCustomerCode.customerCodeSoldTo &&
        shipToCode == selectedShipTo.shipToCustomerCode &&
        returnId.isValidRequestId;

    return isValidLink
        ? Right(returnId)
        : const Left(ApiFailure.returnDetailRoute());
  }

  @override
  Either<ApiFailure, StringValue> extractPaymentBatchAdditionalInfo({
    required Uri link,
  }) {
    final paymentBatchAdditionalInfo =
        StringValue(link.queryParameters['paymentBatchAdditionalInfo'] ?? '');
    final isValidLink =
        _validDomain(link) && paymentBatchAdditionalInfo.isValid();

    return isValidLink
        ? Right(paymentBatchAdditionalInfo)
        : const Left(ApiFailure.returnDetailRoute());
  }

  bool _validDomain(Uri link) {
    final domain = link.host;
    final currentDomain =
        config.baseUrl(currentMarket: AppMarket(deviceStorage.currentMarket()));

    return currentDomain.contains(domain);
  }
}
