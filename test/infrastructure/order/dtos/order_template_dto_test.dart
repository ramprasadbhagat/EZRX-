import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_template_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test order Template ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/getOrderTemplatesResponse.json'),
      );
    });

    test('Test fromDomain', () {
      final configsDto = OrderTemplateDto.fromDomain(
          OrderTemplateDto.fromJson(data['data']['orderTemplates'][0])
              .toDomain()
              .copyWith(
                  user: User.empty().copyWith(
                      username: Username('fake-user'),
                      customerCode: CustomerCode('fake-custcode'),
                      email: EmailAddress('abc@gmail.com'),
                      role:
                          Role.empty().copyWith(type: RoleType('fake-role')))));
      expect(configsDto.templateId, '1231');
    });

    test('Test toJson', () {
      final configsDto = OrderTemplateDto.fromDomain(
              OrderTemplateDto.fromJson(data['data']['orderTemplates'][0])
                  .toDomain()
                  .copyWith(
                      user: User.empty().copyWith(
                          username: Username('fake-user'),
                          customerCode: CustomerCode('fake-custcode'),
                          email: EmailAddress('abc@gmail.com'),
                          role: Role.empty()
                              .copyWith(type: RoleType('fake-role')))))
          .toJson();

      expect(configsDto['id'], '1231');
    });
  });
}
