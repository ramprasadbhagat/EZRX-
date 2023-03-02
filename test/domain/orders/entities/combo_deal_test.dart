import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Combo Deal', () {
    test('K1 case', () {
      final material = ComboDealMaterial.empty().copyWith(
        minQty: 4,
        materialNumber: MaterialNumber('fake-material'),
        rate: -10,
      );
      final comboDeal = ComboDeal.empty().copyWith(
        materialComboDeals: [
          ComboDealMaterialSet(
            materials: [material],
            setNo: 'fake-set',
          ),
        ],
      );

      expect(comboDeal.scheme, ComboDealScheme.k1);
      expect(comboDeal.allMaterials, [material]);
      expect(
        comboDeal.singleDeal(
          materialNumber: MaterialNumber('fake-material'),
        ),
        material,
      );
      expect(
        comboDeal.singleDeal(
          materialNumber: MaterialNumber('fake-number'),
        ),
        ComboDealMaterial.empty(),
      );
    });
  });
}
