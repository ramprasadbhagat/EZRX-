import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/user_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test User DTO', () {
    setUp(() async {
      data = json
          .decode(await rootBundle.loadString('assets/json/userResponse.json'));
    });
    test('For _mergeSalesOrg', () async {
      final user = UserDto.fromJson(data['data']['user']).toDomain();
      expect(user.userSalesOrganisations.length, 19);
    });

    test('For _splitSalesOrg', () async {
      final user = UserDto.fromJson(data['data']['user']).toDomain();
      final userDto = UserDto.fromDomain(user);
      final userDtoMap = userDto.toJson();
      final dynamic userSalesOrganisationList =
          userDtoMap['userSalesOrganisationList'];
      expect(userDto.userSalesOrganisations.length, 20);
      expect(userSalesOrganisationList['value'].length, 20);
    });
    test('For Empty Sale Organisation DTO', () async {
      final newUser = User.empty().copyWith(
          userSalesOrganisations: [SalesOrganisationDto.empty().toDomain()]);
      SalesOrganisationDto.empty().toJson();
      expect(newUser.userSalesOrganisations.length, 1);
    });
  });
}
