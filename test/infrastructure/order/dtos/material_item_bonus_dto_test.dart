import 'package:ezrxmobile/infrastructure/order/dtos/material_item_bonus_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late MaterialItemBonusDto data;
  late dynamic mapObject;
  group('Test material item bonus dto ', () {
    setUp(() async {
      data = const MaterialItemBonusDto(
        additionalBonusFlag: false,
        bonusOverrideFlag: false,
        comment: 'fake-comment',
        expiryDate: '',
        materialNumber: '',
        inStock: 'Yes',
        materialDescription: '',
        qty: 1,
        remainingQty: 0,
      );
      mapObject = {
        'additionalBonusFlag': false,
        'bonusOverrideFlag': false,
        'comment': 'fake-comment',
        'expiryDate': '',
        'materialNumber': '',
        'inStock': 'Yes',
        'materialDescription': '',
        'qty': 1,
        'remainingQty': 0,
      };
    });
    test('Test toDomain', () {
      final configs = MaterialItemBonusDto.fromJson(mapObject).toDomain();
      expect(configs.comment, 'fake-comment');
    });

    test('Test fromDomain', () {
      final configsDto = MaterialItemBonusDto.fromDomain(data.toDomain());
      expect(configsDto.comment, 'fake-comment');
    });

    test('Test toJson', () {
      final configsDtoMap =
          MaterialItemBonusDto.fromDomain(data.toDomain()).toJson();
      expect(configsDtoMap['comment'], 'fake-comment');
    });
  });
}
