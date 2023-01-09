import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_local.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('UserRestrictionLocalDataSource test', () {
    test('fetch', () async {
      final jsonResult = json.decode(
        await rootBundle.loadString('assets/json/userRestrictionResponse.json'),
      )['data']['approverRights'];
      final expectedResult = UserRestrictionListDto.fromJson(jsonResult);

      final resultFromDataSource =
          await UserRestrictionLocalDataSource().fetch();

      expect(resultFromDataSource, expectedResult);
    });
  });
}
