import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';

abstract class IDeepLinkingRepository {
  Either<ApiFailure, OrderNumber> extractOrderNumber({
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  });

  Either<ApiFailure, ReturnRequestsId> extractReturnId({
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
    required Uri link,
  });

  Either<ApiFailure, StringValue> extractPaymentBatchAdditionalInfo({
    required Uri link,
  });
}
