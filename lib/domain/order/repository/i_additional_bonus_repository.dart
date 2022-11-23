import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';

abstract class IBonusMaterialRepository {
  Future<Either<ApiFailure, List<MaterialInfo>>> getMaterialBonus({
    required User user,
    required SalesOrganisationConfigs configs,
    required String searchKey,
    required CustomerCodeInfo customerInfo,
    required ShipToInfo shipInfo,
    required SalesOrganisation salesOrganisation,
    required String pickAndPack,
  });
}
