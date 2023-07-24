import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test submitorderdto ', () {
    setUp(() async {
      data = {
        'username': 'test-name',
        'companyName': 'test-name',
        'customer': <String, dynamic>{}
      };
    });
    test('Test toDomain', () {
      final configs = SubmitOrderDto.fromJson(data).toDomain();

      expect(configs.companyName.getOrCrash(), 'test-name');
    });

    test('Test fromDomain', () {
      final configsDto = SubmitOrderDto.fromDomain(
        SubmitOrderDto.fromJson(data).toDomain(),
      );
      expect(configsDto.companyName, 'test-name');
    });

    test('Test toJson', () {
      final configsDto = SubmitOrderDto.fromDomain(
        SubmitOrderDto.fromJson(data).toDomain(),
      ).toJson();
      expect(configsDto['companyName'], 'test-name');
    });
  });
}
