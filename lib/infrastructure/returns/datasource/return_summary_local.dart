import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/requests_by_user_return_summary.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/requests_by_user_return_summary_dto.dart';
import 'package:flutter/services.dart';

class ReturnSummaryLocalDataSource {
  ReturnSummaryLocalDataSource();

  Future<ReturnSummaryRequestByUser> getReturnSummaryRequestByUser() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/requestsByUserV2Response.json'),
    );

    return ReturnSummaryRequestByUserDto.fromJson(
            data['data']['requestsByUserV2'],)
        .toDomain();
  }
}
