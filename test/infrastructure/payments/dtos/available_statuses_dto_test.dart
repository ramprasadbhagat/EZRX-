import 'dart:convert';
import 'package:ezrxmobile/infrastructure/payments/dtos/available_statuses_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('=> All Credits And Invoices dto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle
            .loadString('assets/json/availableStatusesResponse.json'),
      );
    });

    test('=> AvailableStatusesDto fromJson and toDomain', () {
      final availableStatusesDto = AvailableStatusesDto.fromJson(
        data['data']['availableStatuses'],
      ).toDomain();

      expect(availableStatusesDto.statuses.isNotEmpty, true);
    });
  });
}
