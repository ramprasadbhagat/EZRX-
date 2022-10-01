import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/domain/material/repository/i_material_list_repository.dart';
import 'package:ezrxmobile/infrastructure/material/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/material/datasource/material_list_remote.dart';

class MaterialListRepository implements IMaterialListRepository {
  final Config config;
  final MaterialListLocalDataSource materialListLocalDataSource;
  final MaterialListRemoteDataSource materialListRemoteDataSource;

  MaterialListRepository({
    required this.config,
    required this.materialListLocalDataSource,
    required this.materialListRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<MaterialInfo>>> getMaterialList({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required String orderBy,
    required String searchKey,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialListData =
            await materialListLocalDataSource.getMaterialList(
          loginUserType: user.role.type.loginUserType,
        );

        return Right(materialListData);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final materialListData =
          await materialListRemoteDataSource.getMaterialList(
        user: user,
        salesOrganisation: salesOrganisation,
        salesOrgConfig: salesOrgConfig,
        customerCodeInfo: customerCodeInfo,
        shipToInfo: shipToInfo,
        pageSize: pageSize,
        offset: offset,
        orderBy: orderBy,
        searchKey: searchKey,
      );

      return Right(materialListData);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
