import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_customer_code_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_remote.dart';

class CustomerCodeRepository implements ICustomerCodeRepository {
  final Config config;
  final CustomerCodeRemoteDataSource remoteDataSource;
  final CustomerCodeLocalDataSource localCustomerCodeDataSource;

  CustomerCodeRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localCustomerCodeDataSource,
  });

  @override
  Future<Either<ApiFailure, List<CustomerCodeInfo>>> getCustomerCode(
    SalesOrganisation salesOrganisation,
    String customerCode,
    bool hideCustomer,
    int pageIndex,
    User user,
  ) async {
    final salesOrg = salesOrganisation.salesOrg.getOrCrash();
    if (config.appFlavor == Flavor.mock) {
      try {
        final customerCodeInfo = user.role.type.isSalesRep
            ? await localCustomerCodeDataSource.getSalesRepCustomerCodeList()
            : await localCustomerCodeDataSource.getCustomerCodeList();

        return Right(customerCodeInfo);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final customerCodeInfo = user.role.type.isSalesRep
          ? await remoteDataSource.getSalesRepCustomerCodeList(
              salesOrg: salesOrg,
              customerCode: customerCode,
              paginate: pageIndex,
              hidecustomer: hideCustomer,
              userName: user.username.getOrCrash(),
            )
          : await remoteDataSource.getCustomerCodeList(
              salesOrg: salesOrg,
              customerCode: customerCode,
              paginate: pageIndex,
              hidecustomer: hideCustomer,
            );

      return Right(customerCodeInfo);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
