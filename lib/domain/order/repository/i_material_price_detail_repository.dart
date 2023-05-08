import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class IMaterialPriceDetailRepository {
  Future<Either<ApiFailure, MaterialPriceDetail>>
      getMaterialDetail({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToCodeInfo,
    required MaterialNumber materialNumber,
    bool isComboDealMaterials = false,
  });

  Future<Either<ApiFailure, Map<MaterialQueryInfo, MaterialPriceDetail>>>
      getMaterialDetailList({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToCodeInfo,
    required List<MaterialQueryInfo> materialQueryList,
    bool isComboDealMaterials = false,
  });

  Future<Either<ApiFailure, List<MaterialPriceDetail>>>
      getMaterialDetailListWithZDP5Enabled({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToCodeInfo,
    required Map<MaterialQueryInfo, MaterialPriceDetail> materialQueryList,
  });
}
