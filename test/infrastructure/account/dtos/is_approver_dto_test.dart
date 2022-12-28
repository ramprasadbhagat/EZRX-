import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/dtos/is_approver_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  late IsApproverDto mockIsApproverDto;

  group('IsApproverDto Test', () {
    setUpAll(() async {
      data = json.decode(
        await rootBundle.loadString('assets/json/getIsApproverResponse.json'),
      );
      mockIsApproverDto = IsApproverDto(isApprover: true);
    });

    test('fromJson test', () async {
      final json = data['data']['isApprover'];
      final isApproverDto = IsApproverDto.fromJson(json);
      expect(isApproverDto, mockIsApproverDto);
    });
  });
}
