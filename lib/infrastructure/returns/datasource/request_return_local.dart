import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/return_request.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_dto.dart';
import 'package:flutter/services.dart';

class RequestReturnLocalDatasource {
  RequestReturnLocalDatasource();

  Future<ReturnRequest> searchReturnMaterials() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getRequestReturnMaterials.json'),
    );

    return ReturnRequestDto.fromJson(data['data']['searchReturnMaterials'])
        .toDomain();
  }
}
