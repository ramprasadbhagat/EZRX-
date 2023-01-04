import 'dart:convert';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/policy_configuration_list_dto.dart';
import 'package:flutter/services.dart';

class PolicyConfigurationLocalDataSource {
  PolicyConfigurationLocalDataSource();

  Future<List<PolicyConfigurationList>> getPolicyConfigurationList() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getPolicyConfigurationResponse.json'),
    );

    return List.from(data['data']['policies'])
        .map((e) => PolicyConfigurationListDto.fromJson(e).toDomain())
        .toList();
  }
}
