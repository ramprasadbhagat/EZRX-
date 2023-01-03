import 'package:ezrxmobile/infrastructure/order/dtos/price_tier_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Testprice tier dto ', () {
    setUp(() async {
      data = {
        'Tier': '',
        'PriceTier': [
          {
            'Type': '',
            'Sequence': 0,
            'ApplyBonus':true,
            'Quantity': 10,
            'Rate': 0,
          }
        ],
      };
    });
    test('Test fromDomain', () {
      final configs =
          PriceTierDto.fromDomain(PriceTierDto.fromJson(data).toDomain());
      expect(configs.items[0].quantity, 10);
    });

    test('Test tojson', () {
      final configs =
          PriceTierDto.fromDomain(PriceTierDto.fromJson(data).toDomain()).toJson();
      expect(configs['PriceTier'][0]['Quantity'], 10);
    });

    test('Test pricetieritem fromDomain', () {
      final configs =
          PriceTierItemDto.fromDomain(PriceTierItemDto.fromJson(data['PriceTier'][0]).toDomain());
      expect(configs.quantity, 10);
    });

    test('Test pricetieritem tojson', () {
      final configs =
          PriceTierItemDto.fromDomain(PriceTierItemDto.fromJson(data['PriceTier'][0]).toDomain()).toJson();
      expect(configs['Quantity'], 10);
    });
  });
}
