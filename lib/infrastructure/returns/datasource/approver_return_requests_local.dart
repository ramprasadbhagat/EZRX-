import 'dart:convert';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_requests_id_dto.dart';
import 'package:flutter/services.dart';

class ApproverReturnRequestsLocal {
  ApproverReturnRequestsLocal();

  Future<List<ReturnRequestsId>> getReturns() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/returnRequestsForApproverV2Response.json'),
    );
    
    return List.from(data['data']['requestsForApproverV2']['requestID'])
        .map(
          (e) =>
              ReturnRequestsIdDto.fromJson({'requestId': e}).toDomain(),
        )
        .toList()
      ..retainWhere((element) => element.isValidRequestId);
  }
}
