import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/request_information_dto.dart';
import 'package:flutter/services.dart';

class ReturnSummaryDetailsByRequestLocal {
  ReturnSummaryDetailsByRequestLocal();

  Future<RequestInformation> getReturnSummaryDetailsByRequest() async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/returnRequestInformationV2Response.json',
      ),
    );
    final data = res['data']['requestInformationV2'];

    return RequestInformationDto.fromJson(data).toDomain();
  }
}
