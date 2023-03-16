import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class IMaterialPriceRepository {
  Future<Either<ApiFailure, Map<MaterialNumber, Price>>> getMaterialPrice({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesConfigs,
    required ShipToInfo shipToInfo,
    required List<MaterialNumber> materialNumberList,
    required bool comboDealEligible,
  });
}
