import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group(
    'Test ReturnRequestDto => ',
    () {
      setUp(() async {
        data = json.decode(await rootBundle
            .loadString('assets/json/getRequestReturnMaterials.json'));
      });

      test('=> ReturnRequest  fromDomain', () {
        final returnRequest = ReturnRequestDto.fromDomain(
            ReturnRequestDto.fromJson(data['data']['searchReturnMaterials'])
                .toDomain());
        expect(returnRequest.items.length, 21);
      });

      test('=> ReturnRequest tojson', () {
        final returnRequest = ReturnRequestDto.fromDomain(
                ReturnRequestDto.fromJson(data['data']['searchReturnMaterials'])
                    .toDomain())
            .toJson();
        expect(returnRequest['materials'].length, 21);
      });
    },
  );
}
