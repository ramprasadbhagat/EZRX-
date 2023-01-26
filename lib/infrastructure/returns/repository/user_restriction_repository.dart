import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approval_and_approver_rights.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approval_limit_details.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_remote.dart';
import 'package:ezrxmobile/domain/returns/repository/i_user_restriction_repository.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

import 'package:ezrxmobile/domain/returns/entities/add_return_approval_limit.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/approver_rights_details_dto.dart';

import 'package:ezrxmobile/domain/returns/entities/approver_rights.dart';

class UserRestrictionRepository extends IUserRestrictionRepository {
  final Config config;
  final UserRestrictionLocalDataSource localDataSource;
  final UserRestrictionRemoteDataSource remoteDataSource;

  UserRestrictionRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<String>>> getUserRestrictionsList(
    SalesOrg salesOrg,
  ) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final userRestriction = await localDataSource.fetch();

        return Right(userRestriction.rawMetaData.usernames);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final userRestriction =
          await remoteDataSource.fetch(salesOrg: salesOrg.getOrCrash());

      return Right(userRestriction.rawMetaData.usernames);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, UserRestrictions>>
      getUserRestrictions({
    required SalesOrganisation salesOrganisation,
    required Username userName,
  }) async {
    final salesOrg = salesOrganisation.salesOrg.getOrCrash();
    final username = userName.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final approverRightsList =
            await localDataSource.getUserRestrictions();

        return Right(approverRightsList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final approverRights =
          await remoteDataSource.getUserRestrictions(
        salesOrg: salesOrg,
        userName: username,
      );

      return Right(approverRights);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, AddConfigureUserRestrictionStatus>>
      addApprovalLimit({
    required ApprovalLimits approverLimits,
  }) async {
    final salesOrg = approverLimits.salesOrg.getOrCrash();
    final userName = approverLimits.userName.getOrCrash();
    final valueUpperLimit =
        approverLimits.valueUpperLimit.getValue();
    final valueLowerLimit =
        approverLimits.valueLowerLimit.getValue();

    if (config.appFlavor == Flavor.mock) {
      try {
        final addUserRestriction = await localDataSource.addApprovalLimit();

        return Right(addUserRestriction);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final addUserRestriction = await remoteDataSource.addApprovalLimit(
        salesOrg: salesOrg,
        userName: userName,
        valueLowerLimit: valueLowerLimit,
        valueUpperLimit: valueUpperLimit,
      );

      return Right(addUserRestriction);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, AddConfigureUserRestrictionStatus>>
      configureUserRestriction({
    required ApproverRights approverRights,
  }) async {
    final username = approverRights.userName.getOrCrash();
    final approverRightsList = approverRights.approverRightsList
        .map((e) => ApproverRightsDetailsDto.fromDomain(e).toJson())
        .toList();
    if (config.appFlavor == Flavor.mock) {
      try {
        final configureUserRestriction =
            await localDataSource.configureUserRestriction();

        return Right(configureUserRestriction);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final configureUserRestriction =
          await remoteDataSource.configureUserRestriction(
        userName: username,
        approverRightsList: approverRightsList,
      );

      return Right(configureUserRestriction);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
