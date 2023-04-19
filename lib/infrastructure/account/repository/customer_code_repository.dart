import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_customer_code_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/account_selector_storage_dto.dart';


class CustomerCodeRepository implements ICustomerCodeRepository {
  final Config config;
  final CustomerCodeRemoteDataSource remoteDataSource;
  final CustomerCodeLocalDataSource localCustomerCodeDataSource;
  final AccountSelectorStorage accountSelectorStorage;
  

  CustomerCodeRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localCustomerCodeDataSource,
    required this.accountSelectorStorage,
    
  });

  @override
  Future<Either<ApiFailure, List<CustomerCodeInfo>>> getCustomerCode({
    required SalesOrganisation salesOrganisation,
    required String customerCode,
    required bool hideCustomer,
    required User user,
    required int pageSize,
    required int offset,
  }) async {
    final salesOrg = salesOrganisation.salesOrg.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final customerCodeInfo = user.role.type.isSalesRepRole
            ? await localCustomerCodeDataSource.getSalesRepCustomerCodeList()
            : await localCustomerCodeDataSource.getCustomerCodeList();

        return Right(customerCodeInfo);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final customerCodeInfo = user.role.type.isSalesRepRole
          ? await remoteDataSource.getSalesRepCustomerCodeList(
              salesOrg: salesOrg,
              customerCode: customerCode,
              hidecustomer: hideCustomer,
              userName: user.username.getOrCrash(),
              pageSize: pageSize,
              offset: offset,
            )
          : await remoteDataSource.getCustomerCodeList(
              salesOrg: salesOrg,
              customerCode: customerCode,
              hidecustomer: hideCustomer,
              pageSize: pageSize,
              offset: offset,
            );

      return Right(customerCodeInfo);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> storeCustomerCode({
    required String customerCode,
  }) async {
    try {
      final accountSelectorStorageDto = await accountSelectorStorage.get();
      final accountSelector = accountSelectorStorageDto.toDomain();
      await accountSelectorStorage.set(
        accountSelectorStorageDto: AccountSelectorStorageDto.fromDomain(
          accountSelector: accountSelector.copyWith(customerCode: customerCode),
        ),
      );
      
      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, AccountSelector>> getCustomerCodeStorage() async {
    try {
      final accountSelectorStorageDto = await accountSelectorStorage.get();

      return Right(accountSelectorStorageDto.toDomain());
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
