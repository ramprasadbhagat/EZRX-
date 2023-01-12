import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_type_code_details_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test ReturnRequestTypeCodeDto', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/getReturnRequestTypeCode.json'),
      );
    });
    test('Test toDomain', () {
      final configs = ReturnRequestTypeCodeDetailsDto.fromJson(
        data['data']['typeOfRequest'][0],
      ).toDomain();
      expect(configs.returnCode, '500');
    });

    test('Test fromDomain', () {
      final configsDto = ReturnRequestTypeCodeDetailsDto.fromDomain(
          ReturnRequestTypeCodeDetailsDto.fromJson(
        data['data']['typeOfRequest'][0],
      ).toDomain());
      expect(configsDto.returnCode, '500');
    });
  });
}
