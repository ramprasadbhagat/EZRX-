import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/dtos/return_price_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group(
    'Test ReturnPrice dto => ',
    () {
      setUp(() async {
        data = json.decode(
            await rootBundle.loadString('assets/json/getReturnPrice.json'));
      });
      test('=> return price to domain', () {
        final returnRequest =
            ReturnPriceDto.fromJson(data['data']['getReturnPrice'][0])
                .toDomain();
        expect(returnRequest, returnRequest);
      });
    },
  );
}
