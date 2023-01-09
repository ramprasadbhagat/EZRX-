import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_raw_meta_data_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  late UserRestrictionListDto userRestrictionListDtoMock;

  group('UserRestrictionListDto Test', () {
    setUpAll(() async {
      data = json.decode(
        await rootBundle.loadString('assets/json/userRestrictionResponse.json'),
      );
      final userRestrictionListRawMetaDataDto =
          UserRestrictionListRawMetaDataDto.fromJson(
        data['data']['approverRights']['rawMetaData'],
      );
      userRestrictionListDtoMock = UserRestrictionListDto(
        rawMetaData: userRestrictionListRawMetaDataDto,
      );
    });

    test('fromJson test', () async {
      final json = data['data']['approverRights'];
      final userRestrictionListDto = UserRestrictionListDto.fromJson(json);
      expect(userRestrictionListDto, userRestrictionListDtoMock);
    });
  });
}
