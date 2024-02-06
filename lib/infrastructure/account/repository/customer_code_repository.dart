import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_customer_code_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/account_selector_storage_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_search_dto.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/account_selector_storage.dart';

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
  Future<Either<ApiFailure, CustomerInformation>> getCustomerCode({
    required SalesOrganisation salesOrganisation,
    required List<String> customerCodes,
    required bool hideCustomer,
    required User user,
    required int pageSize,
    required int offset,
  }) async {
    final salesOrg = salesOrganisation.salesOrg.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final customerCodeInfoList = user.role.type.isSalesRepRole
            ? await localCustomerCodeDataSource.getSalesRepCustomerCodeList()
            : await localCustomerCodeDataSource.getCustomerCodeList();

        return Right(customerCodeInfoList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    final futureResults = <List<CustomerCodeInfo>>[];
    Object? exception;
    var shipToCount = 0;
    await Future.wait(
      customerCodes.map(
        (customerCode) async {
          try {
            final response = user.role.type.isSalesRepRole
                ? await remoteDataSource.getSalesRepCustomerCodeList(
                    request: CustomerCodeSearchDto(
                      salesOrg: salesOrg,
                      first: pageSize,
                      filterBlockCustomer: hideCustomer,
                      after: offset,
                      searchKey: customerCode,
                    ),
                  )
                : await remoteDataSource.getCustomerCodeList(
                    salesOrg: salesOrg,
                    customerCode: customerCode,
                    hideCustomer: hideCustomer,
                    pageSize: pageSize,
                    offset: offset,
                  );
            futureResults.add(response.soldToInformation);
            shipToCount += response.shipToCount;
          } catch (e) {
            //for single calls, we will capture error
            //for clubbed concurrent calls, we will not capture any error
            if (customerCodes.length == 1) {
              exception = e;
            }
          }
        },
      ),
    );

    if (customerCodes.length == 1 && exception != null) {
      return Left(FailureHandler.handleFailure(exception!));
    }

    final customerCodeList = <CustomerCodeInfo>[
      ...futureResults.expand((codeList) => codeList),
    ];

    return Right(
      CustomerInformation(
        shipToCount: shipToCount,
        soldToInformation: customerCodeList,
      ),
    );
  }

  @override
  Future<Either<ApiFailure, Unit>> storeCustomerInfo({
    required String customerCode,
    required String shippingAddress,
  }) async {
    try {
      final accountSelectorStorageDto = await accountSelectorStorage.get();
      final accountSelector = accountSelectorStorageDto.toDomain();
      await accountSelectorStorage.set(
        accountSelectorStorageDto: AccountSelectorStorageDto.fromDomain(
          accountSelector: accountSelector.copyWith(
            customerCode: customerCode,
            shippingAddress: shippingAddress,
          ),
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
