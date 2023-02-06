import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/requests_by_user_return_summary.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/requests_by_user_return_summary_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_request_information_dto.dart';
import 'package:flutter/services.dart';

class ReturnSummaryLocalDataSource {
  ReturnSummaryLocalDataSource();

  Future<List<ReturnSummaryRequestByUser>>
      getReturnSummaryRequestByUser() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/requestsByUserV2Response.json'),
    );

    return List.from(data['data']['requestsByUserV2'])
        .map((e) => ReturnSummaryRequestByUserDto.fromJson(e).toDomain())
        .toList();
  }

  Future<ReturnSummaryRequestInformation> getReturnSummaryInformation() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/requestInformationV2Response.json'),
    );


    return ReturnSummaryRequestInformationDto.fromJson(
            data['data']['requestInformationV2'],)
        .toDomain();
  }
}
