import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/approver_return_request.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/approver_return_request_dto.dart';
import 'package:flutter/services.dart';

class ApproverReturnRequestInformationLocal {
  ApproverReturnRequestInformationLocal();

  Future<ApproverReturnRequest> getApproverReturnRequestInfomration(
      {
    required String returnRequestId,
  }) async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/returnRequestInformationV2Response.json',
      ),
    );
    final res = data['data']['requestInformationV2'];

    return ApproverReturnRequestDto.fromJson(res).toDomain();
  }
}
