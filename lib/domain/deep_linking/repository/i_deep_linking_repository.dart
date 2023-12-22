import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';

abstract class IDeepLinkingRepository {
  Either<ApiFailure, MaterialNumber> extractMaterialNumber({
    required Uri link,
  });

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

  Either<ApiFailure, PaymentSummaryDetails> extractPaymentIdentifierInfo({
    required Uri link,
  });

  Either<ApiFailure, String> extractInvoiceNumber({
    required Uri link,
  });
}
