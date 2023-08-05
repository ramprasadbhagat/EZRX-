import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:ezrxmobile/domain/returns/entities/submit_return_response.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/submit_return_response_dto.dart';

class SubmitReturnRequestLocalDataSource {
  SubmitReturnRequestLocalDataSource();

  Future<SubmitReturnResponse> submitReturnRequest() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getSubmitReturnRequestResponse.json'),
    );

    return SubmitReturnResponseDto.fromJson(
      data['data']['addRequestV2'],
    ).toDomain();
  }
}
