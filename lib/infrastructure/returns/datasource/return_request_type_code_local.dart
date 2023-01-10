import 'dart:convert';
import 'package:ezrxmobile/domain/returns/entities/return_request_type_code_details.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_type_code_details_dto.dart';
import 'package:flutter/services.dart';

class ReturnRequestTypeCodeLocalDataSource {
  ReturnRequestTypeCodeLocalDataSource();

  Future<List<ReturnRequestTypeCodeDetails>> getReturnRequestTypeCodeList() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getReturnRequestTypeCode.json'),
    );

    return List.from(data['data']['typeOfRequest'])
        .map((e) => ReturnRequestTypeCodeDetailsDto.fromJson(e).toDomain())
        .toList();
  }
}
