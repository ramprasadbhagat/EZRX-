import 'dart:convert';


import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/request_information_dto.dart';
import 'package:flutter/services.dart';

class ReturnSummaryDetailsRequestInformationLocal {
  ReturnSummaryDetailsRequestInformationLocal();

  Future<RequestInformation> getRequestInformation({
    required String returnRequestId,
  }) async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/returnRequestInformationV2Response.json',
      ),
    );
    final res = data['data']['requestInformationV2'];

    return RequestInformationDto.fromJson(res).toDomain();
  }
}
