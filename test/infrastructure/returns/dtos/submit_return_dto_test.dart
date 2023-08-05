import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/dtos/submit_return_response_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group(
    'Test Submit Return => ',
    () {
      setUp(() async {
        data = json.decode(
          await rootBundle
              .loadString('assets/json/getSubmitReturnRequestResponse.json'),
        );
      });

      test('=> submit return to domain', () {
        final submitResponse = SubmitReturnResponseDto.fromJson(
          data['data']['addRequestV2'],
        ).toDomain();
        expect(submitResponse, submitResponse);
      });
    },
  );
}
