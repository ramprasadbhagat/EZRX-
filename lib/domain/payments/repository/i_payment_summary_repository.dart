import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details_response.dart';

abstract class IPaymentSummaryRepository {
  Future<Either<ApiFailure, PaymentSummaryDetailsResponse>>
      fetchPaymentSummaryList({
    required PaymentSummaryDetailsResponse paymentSummaryDetails,
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required int offset,
    required int pageSize,
  });
}
