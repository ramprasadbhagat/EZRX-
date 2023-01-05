import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/usage_dto.dart';
import 'package:flutter/services.dart';

class UsageLocalDataSource {
  UsageLocalDataSource();

  Future<List<Usage>> getUsages() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getUsageResponse.json'),
    );

    return List.from(data['data']['usage'])
        .map((e) => UsageDto.fromJson(e).toDomain())
        .toList();
  }
}
