import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class IMaterialListRepository {

  Future<Either<ApiFailure, MaterialResponse>> getMaterialList({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required String orderByName,
  });

  Future<Either<ApiFailure, List<MaterialInfo>>> searchMaterialList({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required String orderBy,
    required String searchKey,
    required MaterialFilter selectedMaterialFilter,
    required String pickAndPack,
    bool isForFoc = false,
  });

  Future<Either<ApiFailure, List<MaterialInfo>>> getComboDealMaterials({
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required int pageSize,
    required int offset,
    required List<String> principles,
  });

  Future<Either<ApiFailure, MaterialInfo>> getScanMaterial({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Ean ean,
    required User user,
  });

  Future<Either<ApiFailure, List<MaterialStockInfo>>> getStockInfoList({
    required List<MaterialInfo> materials,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
  });

  Future<Either<ApiFailure, MaterialInfo>> getMaterialData({
    required MaterialInfo material,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required String type,
  });

  Future<Either<ApiFailure, Map<MaterialNumber, MaterialInfo>>> getBundleData({
    required List<MaterialInfo> materials,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  });
}
