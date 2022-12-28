import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/datasource/approver_local.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/is_approver_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ApproverLocalDataSource test', () {
    test('fetch', () async {
      final jsonResult = json.decode(
        await rootBundle.loadString('assets/json/getIsApproverResponse.json'),
      )['data']['isApprover'];
      final expectedResult = IsApproverDto.fromJson(jsonResult);

      final resultFromDataSource = await ApproverLocalDataSource().fetch();

      expect(resultFromDataSource, expectedResult);
    });
  });
}
