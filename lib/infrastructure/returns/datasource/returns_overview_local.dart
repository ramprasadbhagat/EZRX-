import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/returns_overview.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/returns_overview_dto.dart';
import 'package:flutter/services.dart';

class ReturnsOverviewLocalDataSource {
  Future<ReturnsOverview> fetch() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/returnRequestsOverviewV2Response.json'),
    );
    final finalData = data['data']['approverRights'];

    return ReturnsOverviewDto.fromJson(finalData).toDomain();
  }
}
