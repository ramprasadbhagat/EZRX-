import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
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

      expect(comboDeal.scheme, ComboDealScheme.k21);
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

      expect(comboDeal.scheme, ComboDealScheme.k22);
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

    test('K5 case', () {
      final comboDeal = ComboDeal.empty().copyWith(
        flexiTierRule: [
          ComboDealTierRule.empty(),
        ],
      );

      expect(comboDeal.scheme, ComboDealScheme.k5);
    });

    test('Sort rule tier with min amount descending', () {
      final comboDeal = ComboDeal.empty().copyWith(
        flexiTierRule: [
          ComboDealTierRule.empty().copyWith(minTotalAmount: 10),
          ComboDealTierRule.empty().copyWith(minTotalAmount: 100),
          ComboDealTierRule.empty().copyWith(minTotalAmount: 30),
          ComboDealTierRule.empty().copyWith(minTotalAmount: 40),
        ],
      );

      expect(
        comboDeal.descendingSortedMinAmountTiers,
        [
          ComboDealTierRule.empty().copyWith(minTotalAmount: 100),
          ComboDealTierRule.empty().copyWith(minTotalAmount: 40),
          ComboDealTierRule.empty().copyWith(minTotalAmount: 30),
          ComboDealTierRule.empty().copyWith(minTotalAmount: 10),
        ],
      );
    });

    test('Check material deal', () {
      final materialComboDeal = ComboDeal.empty().copyWith(
        flexiQtyTier: [
          ComboDealQtyTier.empty(),
        ],
      );
      final principleComboDeal = ComboDeal.empty().copyWith(
        flexiTierRule: [
          ComboDealTierRule.empty(),
        ],
      );

      expect(materialComboDeal.isMaterialDeal, true);
      expect(principleComboDeal.isMaterialDeal, false);
    });
  });
}
