import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/returns/repository/i_policy_configuration_repository.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_remote.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

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
  Future<Either<ApiFailure, List<PolicyConfiguration>>> getPolicyConfiguration({
    required SalesOrganisation salesOrganisation,
    required SearchKey searchKey,
    required int offSet,
    required int pageSize,
  }) async {
    final searchValue = searchKey.getValue();
    if (config.appFlavor == Flavor.mock) {
      try {
        final policyConfigurationList =
            await localDataSource.getPolicyConfiguration();

        return Right(policyConfigurationList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final policyConfigurationList =
          await remoteDataSource.getPolicyConfiguration(
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        offSet: offSet,
        pageSize: pageSize,
        searchKey: searchValue,
      );

      return Right(policyConfigurationList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<PolicyConfiguration>>> getDeletePolicy({
    required PolicyConfiguration policyConfigurationItem,
    required List<PolicyConfiguration> policyConfigurationList,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final newpolicyConfigurationList =
            List<PolicyConfiguration>.from(policyConfigurationList)
              ..removeWhere(
                (element) => element.uuid == policyConfigurationItem.uuid,
              );

        return Right(newpolicyConfigurationList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      await remoteDataSource.getDeletePolicyConfiguration(
        policyConfiguration: policyConfigurationItem,
      );
      final newpolicyConfigurationList =
          List<PolicyConfiguration>.from(policyConfigurationList)
            ..removeWhere(
              (element) => element.uuid == policyConfigurationItem.uuid,
            );

      return Right(newpolicyConfigurationList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<PolicyConfiguration>>> getAddPolicy({
    required PolicyConfiguration policyConfigurationItems,
    required List<PolicyConfiguration> policyConfigurationList,
  }) async {
    final policyConfiguration = PolicyConfiguration.empty().copyWith(
      salesOrg: SalesOrg(policyConfigurationItems.salesOrg.getOrCrash()),
      principalCode: policyConfigurationItems.principalCode,
      monthsBeforeExpiry: policyConfigurationItems.monthsBeforeExpiry,
      monthsAfterExpiry: policyConfigurationItems.monthsAfterExpiry,
      returnsAllowed:
          ReturnsAllowed(policyConfigurationItems.returnsAllowed.getOrCrash()),
    );
    if (config.appFlavor == Flavor.mock) {
      try {
        final newpolicyConfigurationList =
            List<PolicyConfiguration>.from(policyConfigurationList)
              ..add(
                policyConfiguration.copyWith(
                  uuid: policyConfigurationItems.uuid,
                ),
              );

        return Right(newpolicyConfigurationList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }

    try {
      final newPolicyConfiguration =
          await remoteDataSource.geAddPolicyConfiguration(
        policyConfiguration: policyConfiguration,
      );
      final newpolicyConfigurationList =
          List<PolicyConfiguration>.from(policyConfigurationList)
            ..add(
              policyConfiguration.copyWith(
                uuid: newPolicyConfiguration.uuid,
              ),
            );

      return Right(newpolicyConfigurationList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
