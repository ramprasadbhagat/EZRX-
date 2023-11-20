import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/re_order_permission.dart';
import 'package:ezrxmobile/domain/order/repository/i_re_order_permission_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_remote.dart';

class ReOrderPermissionRepository implements IReOrderPermissionRepository {
  final Config config;
  final ReOrderPermissionLocalDataSource localDataSource;
  final ReOrderPermissionRemoteDataSource remoteDataSource;

  ReOrderPermissionRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, ReOrderPermission>> getReorderPermission({
    required SalesOrganisation salesOrganisation,
    required List<MaterialNumber> materialNumbers,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final reOrderPermission = await localDataSource.getPermission();

        return Right(reOrderPermission);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }

    try {
      // TODO: Revisit to remove this check once validCustomerMaterial API is ready for ID
      if (salesOrganisation.salesOrg.isID) {
        return Right(
          ReOrderPermission(
            validMaterials: materialNumbers
                .map((e) => ValidMaterial.empty().copyWith(materialNumber: e))
                .toList(),
          ),
        );
      }

      final reOrderPermission = await remoteDataSource.getPermission(
        materialNumbers: materialNumbers.map((e) => e.getValue()).toList(),
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        salesOrg: salesOrganisation.salesOrg.getValue(),
      );
      final validMaterialNumbers =
          reOrderPermission.validMaterials.map((e) => e.materialNumber);

      if (materialNumbers.every((e) => !validMaterialNumbers.contains(e))) {
        return const Left(ApiFailure.allReorderItemInvalid());
      }

      return Right(reOrderPermission);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
