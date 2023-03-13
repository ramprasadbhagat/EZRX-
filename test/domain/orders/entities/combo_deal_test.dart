import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
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

    test('K2.1 case', () {
      final comboDeal = ComboDeal.empty().copyWith(
        groupDeal: ComboDealGroupDeal.empty().copyWith(
          minTotalQuantity: 10,
        ),
        materialComboDeals: [
          ComboDealMaterialSet(
            materials: [ComboDealMaterial.empty()],
            setNo: 'fake-set',
          ),
        ],
      );

      expect(comboDeal.scheme, ComboDealScheme.k2);
    });

    test('K2.2 case', () {
      final comboDeal = ComboDeal.empty().copyWith(
        flexiQtyTier: [
          ComboDealQtyTier.empty(),
        ],
        materialComboDeals: [
          ComboDealMaterialSet(
            materials: [ComboDealMaterial.empty()],
            setNo: 'fake-set',
          ),
        ],
      );

      expect(comboDeal.scheme, ComboDealScheme.k2);
    });

    test('Sort QtyTiers with minQty descending', () {
      final comboDeal = ComboDeal.empty().copyWith(
        flexiQtyTier: [
          ComboDealQtyTier.empty().copyWith(minQty: 2),
          ComboDealQtyTier.empty().copyWith(minQty: 6),
          ComboDealQtyTier.empty().copyWith(minQty: 1),
        ],
      );

      expect(comboDeal.descendingSortedQtyTiers, [
        ComboDealQtyTier.empty().copyWith(minQty: 6),
        ComboDealQtyTier.empty().copyWith(minQty: 2),
        ComboDealQtyTier.empty().copyWith(minQty: 1),
      ]);
    });
  });
}
