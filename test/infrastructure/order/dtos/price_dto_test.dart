import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late PriceDto data;
  group('Test pricedto ', () {
    setUp(() async {
      data = const PriceDto(
          materialNumber: '1234',
          rules: [],
          tiers: [],
          bonuses: [],
          bundles: [],
          overrideRulePresent: false,
          zdp5MaxQuota: '',
          zdp5RemainingQuota: '',
          zmgDiscount: false,
          listPrice: 12,
          finalIndividualPrice: 12,
          finalTotalPrice: 12,
          additionalBonusEligible: false,
          isValid: false,
          isPriceOverride: true,
          zdp8Override: 12,
          priceOverride: 12);
    });
    test('Test get overridequery', () {
      final configs = data.overrideQuery;
      final expectedRes = {
        'MaterialNumber': '1234',
        'ZPO1': 12,
        'ZDP8': 12,
      };
      expect(configs, expectedRes);
    });

    test('Test get priceOverrideQuery', () {
      final configs = data.priceOverrideQuery(12);
      final expectedRes = <String, dynamic>{
        'MaterialNumber': '1234',
        'ZPO1': 12,
        'ZDP8': 12,
      };
      expect(configs, expectedRes);
    });
  });
}
