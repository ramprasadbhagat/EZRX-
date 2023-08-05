import 'package:ezrxmobile/infrastructure/order/dtos/price_rule_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Test material item bonus dto ', () {
    setUp(() async {
      data = {
        'Type': '',
        'Rate': 12,
        'Conditions': '',
        'ConditionNumber': '',
        'materialNumber': '',
        'BonusEligible': false,
      };
    });
    test('Test fromDomain', () {
      final configs =
          PriceRuleDto.fromDomain(PriceRuleDto.fromJson(data).toDomain());
      expect(configs.rate, 12);
    });

    test('Test tojson', () {
      final configs =
          PriceRuleDto.fromDomain(PriceRuleDto.fromJson(data).toDomain())
              .toJson();
      expect(configs['Rate'], 12);
    });
  });
}
