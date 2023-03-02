import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

abstract class IPolicyConfigurationRepository {
  Future<Either<ApiFailure, List<PolicyConfiguration>>> getPolicyConfiguration({
    required SalesOrganisation salesOrganisation,
    required SearchKey searchKey,
    required int offSet,
    required int pageSize,
  });
  Future<Either<ApiFailure, List<PolicyConfiguration>>> getDeletePolicy({
    required PolicyConfiguration policyConfigurationItem,
    required List<PolicyConfiguration> policyConfigurationList,
  });
  Future<Either<ApiFailure, List<PolicyConfiguration>>> getAddPolicy({
    required PolicyConfiguration policyConfigurationItems,
    required List<PolicyConfiguration> policyConfigurationList,
  });
}
