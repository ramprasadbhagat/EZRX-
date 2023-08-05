import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_local.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_status_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restrictions_dto.dart';
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

    test('getUserRestrictionDetails', () async {
      final jsonResult = json.decode(
        await rootBundle
            .loadString('assets/json/getReturnApprovalAndApproverRights.json'),
      )['data'];
      final expectedResult =
          UserRestrictionsDto.fromJson(jsonResult).toDomain();

      final resultFromDataSource =
          await UserRestrictionLocalDataSource().getUserRestrictions();

      expect(resultFromDataSource, expectedResult);
    });

    test('add approval limit', () async {
      final jsonResult = json.decode(
        await rootBundle
            .loadString('assets/json/getAddUserRestrictionDetails.json'),
      )['data'];
      final expectedResult =
          UserRestrictionStatusDto.fromJson(jsonResult).toDomain();

      final resultFromDataSource =
          await UserRestrictionLocalDataSource().addApprovalLimit();

      expect(resultFromDataSource, expectedResult);
    });

    test('configure User Restriction', () async {
      final jsonResult = json.decode(
        await rootBundle
            .loadString('assets/json/getConfigureUserRestrictionDetails.json'),
      )['data'];
      final expectedResult =
          UserRestrictionStatusDto.fromJson(jsonResult).toDomain();

      final resultFromDataSource =
          await UserRestrictionLocalDataSource().configureUserRestriction();

      expect(resultFromDataSource, expectedResult);
    });

    test('delete User Restriction', () async {
      final jsonResult = json.decode(
        await rootBundle
            .loadString('assets/json/getDeleteUserRestriction.json'),
      )['data'];
      final expectedResult =
          UserRestrictionStatusDto.fromJson(jsonResult).toDomain();

      final resultFromDataSource =
          await UserRestrictionLocalDataSource().deleteApprovalRights();

      expect(resultFromDataSource, expectedResult);
    });

    test('delete approval limit', () async {
      final jsonResult = json.decode(
        await rootBundle
            .loadString('assets/json/getDeleteReturnApprovalLimit.json'),
      )['data'];
      final expectedResult =
          UserRestrictionStatusDto.fromJson(jsonResult).toDomain();

      final resultFromDataSource =
          await UserRestrictionLocalDataSource().deleteApprovalLimit();

      expect(resultFromDataSource, expectedResult);
    });
  });
}
