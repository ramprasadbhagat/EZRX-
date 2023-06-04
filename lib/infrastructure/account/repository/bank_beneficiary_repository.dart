import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary_response.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/account/repository/i_bank_beneficiary_repository.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bank_beneficiary_dto.dart';

class BankBeneficiaryRepository implements IBankBeneficiaryRepository {
  final Config config;
  final BankBeneficiaryRemoteDataSource remoteDataSource;
  final BankBeneficiaryLocalDataSource localDataSource;

  BankBeneficiaryRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, List<BankBeneficiary>>>
      getBankBeneficiaries() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final manageBeneficiary = await localDataSource.getBankBeneficiaries();

        return Right(manageBeneficiary);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final manageBeneficiary = await remoteDataSource.getBankBeneficiaries();

      return Right(manageBeneficiary);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<SalesDistrict>>> getSalesDistrict(
      {required SalesOrg salesOrg,}) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final salesDistrict = await localDataSource.getSalesDistrict();

        return Right(salesDistrict);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final salesDistrict =
          await remoteDataSource.getSalesDistrict(salesOrg: salesOrg.getOrCrash());

      return Right(salesDistrict);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, BankBeneficiaryResponse>> addOrUpdateBeneficiary(
      {required BankBeneficiary beneficiaryData,}) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.addOrUpdateBeneficiary();

        return Right(response);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final response = await remoteDataSource.addOrUpdateBeneficiary(
          beneficiaryData: BankBeneficiaryDto.fromDomain(beneficiaryData).toJson(),
      );

      return Right(response);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, BankBeneficiaryResponse>> deleteBeneficiary(
    {
      required SalesOrg salesOrg, 
      required String salesDistrict,
    }
    )async {
   if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.deleteBeneficiary();

        return Right(response);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final response = await remoteDataSource.deleteBeneficiary(
         salesOrg: salesOrg.getOrCrash(),
         salesDistrict: salesDistrict,
      );

      return Right(response);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
