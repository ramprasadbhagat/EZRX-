import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';

import 'package:ezrxmobile/domain/account/entities/user.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/returns/entities/submit_return_response.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

abstract class ISubmitRequestReturnRepository {
  Future<Either<ApiFailure, SubmitReturnResponse>> submitRequestReturn({
    required List<ReturnItem> returnItemsList,
    required User user,
    required SalesOrganisation salesOrg,
    required CustomerCodeInfo customerCodeInfo,
    required String returnReferenceNumber,
    required String specialInstructions,
  });
}
