import 'dart:convert';
import 'package:ezrxmobile/domain/account/entities/update_sales_org/update_sales_organisation_configs.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/update_sales_org/update_sales_organisation_configs_dto.dart';
import 'package:flutter/services.dart';

class UpdateSalesOrgLocalDataSource {
  UpdateSalesOrgLocalDataSource();

  Future<UpdateSalesOrganisationConfigs> updateSalesOrgConfig({
    required String salesOrg,
  }) async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/updateSalesOrgConfig${salesOrg}Response.json',
      ),
    );

    return UpdateSalesOrganisationConfigsDto.fromJson(
      data['data']['updateSalesOrgConfig']['salesOrgConfig'],
    ).toDomain();
  }
}
