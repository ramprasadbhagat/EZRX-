import 'package:ezrxmobile/infrastructure/order/dtos/price_bonus_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late PriceBonusDto data;
  group('Test bundleInfoDto ', () {
    setUp(() async {
      data = const PriceBonusDto(
        items: [
          PriceBonusItemDto(
            calculation: '',
            qualifyingQuantity: 10,
            bonusMaterials: [],
          )
        ],
      );
    });
    test('Test fromDomain', () {
      final configsDto = PriceBonusDto.fromDomain(data.toDomain());

      expect(configsDto.items[0].qualifyingQuantity, 10);
    });

    test('Test toJson', () {
      final configsDto = data.toJson();

      expect(configsDto['BonusTiers'][0]['QualifyingQuantity'], 10);
    });

    test('Test pricebonusitem from domain', () {
      final data = {
        'Calculation': 'fake-data',
        'QualifyingQuantity': 12,
        'BonusMaterial': []
      };
      final configsDtoMap = PriceBonusItemDto.fromDomain(
        PriceBonusItemDto.fromJson(data).toDomain(),
      );
      expect(configsDtoMap.qualifyingQuantity, 12);
    });

    test('Test Bonus Material Dto From Domain', () {
      const data = {
        'MaterialNumber': '1234',
        'MaterialDescription': '',
        'Calculation': '',
        'BonusRatio': 1,
        'QualifyingQuantity': 1,
        'BonusQuantity': 1
      };
      final configs = BonusMaterialDto.fromDomain(
        BonusMaterialDto.fromJson(data).toDomain(),
      );
      expect(configs.bonusQuantity, 1);
    });
  });
}
