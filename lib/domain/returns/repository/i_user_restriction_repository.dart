import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/returns/entities/return_approval_and_approver_rights.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approval_limit_details.dart';

import 'package:ezrxmobile/domain/returns/entities/add_return_approval_limit.dart';

import 'package:ezrxmobile/domain/returns/entities/approver_rights.dart';

abstract class IUserRestrictionRepository {
  Future<Either<ApiFailure, List<String>>> getUserRestrictionsList(
    SalesOrg salesOrg,
  );

  Future<Either<ApiFailure, UserRestrictions>>
      getUserRestrictions({
    required SalesOrganisation salesOrganisation,
    required Username userName,
  });

  Future<Either<ApiFailure, AddConfigureUserRestrictionStatus>>
      addApprovalLimit({
    required ApprovalLimits approverLimits,
  });

  Future<Either<ApiFailure, AddConfigureUserRestrictionStatus>>
      configureUserRestriction({
    required ApproverRights approverRights,
  });
}
