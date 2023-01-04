import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/returns/repository/i_poilcy_configuration_repository.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_list_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_list_remote.dart';

class PolicyConfigurationRepository implements IPolicyConfigurationRepository {
  final Config config;
  final PolicyConfigurationLocalDataSource localDataSource;
  final PolicyConfigurationRemoteDataSource remoteDataSource;
  final CountlyService countlyService;

  PolicyConfigurationRepository({
    required this.config,
    required this.localDataSource,
    required this.countlyService,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<PolicyConfigurationList>>>
      getPolicyConfigurationList({
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final policyConfigurationList =
            await localDataSource.getPolicyConfigurationList();

        return Right(policyConfigurationList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final policyConfigurationList =
          await remoteDataSource.getPolicyConfigurationList(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
      );

      return Right(policyConfigurationList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
