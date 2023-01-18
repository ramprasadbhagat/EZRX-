import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';

abstract class IPolicyConfigurationRepository {
  Future<Either<ApiFailure, List<PolicyConfiguration>>> getPolicyConfiguration({
    required SalesOrganisation salesOrganisation,
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
