import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';


import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

abstract class IPaymentSummaryRepository {
  Future<Either<ApiFailure, List<PaymentSummaryDetails>>> fetchPaymentSummaryList({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required int offset,
    required int pageSize,
  });
}
