import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/repository/i_valid_customer_material_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/app_method.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_material_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_material_remote.dart';

class ValidCustomerMaterialRepository
    implements IValidCustomerMaterialRepository {
  final Config config;
  final AppMethods appMethods;
  final ValidCustomerMaterialLocalDataSource localDataSource;
  final ValidCustomerMaterialRemoteDataSource remoteDataSource;
  ValidCustomerMaterialRepository({
    required this.config,
    required this.appMethods,
    required this.localDataSource,
    required this.remoteDataSource,
  });
  @override
  Future<Either<ApiFailure, List<MaterialNumber>>> getValidMaterialList({
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required List<MaterialNumber> materialList,
    required List<MaterialNumber> focMaterialList,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final validMaterialList = await localDataSource.getValidMaterialList(
          userName: user.username.getOrCrash(),
          salesOrganisation: salesOrganisation.salesOrg.getOrCrash(),
          customerCode: customerCodeInfo.customerCodeSoldTo,
          shipToCode: shipToInfo.shipToCustomerCode,
          pickAndPackValue: appMethods.getPickAndPackValue(true),
          materialList:
              materialList.map((MaterialNumber e) => e.getOrCrash()).toList(),
          focMaterialList: focMaterialList
              .map((MaterialNumber e) => e.getOrCrash())
              .toList(),
        );

        return Right(validMaterialList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final validMaterialList = await remoteDataSource.getValidMaterialList(
        userName: user.username.getOrCrash(),
        salesOrganisation: salesOrganisation.salesOrg.getOrCrash(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        pickAndPackValue: appMethods.getPickAndPackValue(true),
        materialList:
            materialList.map((MaterialNumber e) => e.getOrCrash()).toList(),
        focMaterialList:
            focMaterialList.map((MaterialNumber e) => e.getOrCrash()).toList(),
      );

      return Right(validMaterialList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
