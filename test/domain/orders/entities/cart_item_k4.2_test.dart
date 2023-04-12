import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_sku_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final data = json.decode(
    await rootBundle
        .loadString('assets/json/getComboDealForMaterialResponseK4.2.json'),
  );

  final comboDeal = List.from(data['data']['comboDealForMaterials'])
      .map((e) => ComboDealDto.fromJson(e).toDomain)
      .toList()
      .first;

  PriceAggregate comboMaterial(
    MaterialNumber materialNumber,
    int quantity,
    double price,
  ) =>
      PriceAggregate.empty().copyWith(
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: materialNumber,
        ),
        price: Price.empty().copyWith(
          lastPrice: MaterialPrice(price),
        ),
        quantity: quantity,
        comboDeal: comboDeal,
      );

  //total material Qty: 6 => suffix 1, 60 => suffix 2

  final percentDealMaterial =
      comboMaterial(MaterialNumber('000000000021130726'), 1, 100);
  final amountDealMaterial =
      comboMaterial(MaterialNumber('000000000021130718'), 1, 100);
  final invalidDealMaterial =
      comboMaterial(MaterialNumber('000000000021222875'), 1, 100);

  final cartItem = CartItem.comboDeal([
    percentDealMaterial,
    amountDealMaterial.copyWith(quantity: 5),
    invalidDealMaterial,
  ]);

  group('Cart Item K4.2 -', () {
    test('Combo not eligible when total qty is not suffice', () {
      expect(
          CartItem.comboDeal([amountDealMaterial]).isComboDealEligible, false);
    });
    test('Combo eligible when when total qty is suffice', () {
      expect(
          CartItem.comboDeal([
            percentDealMaterial,
            amountDealMaterial.copyWith(quantity: 5)
          ]).isComboDealEligible,
          true);
    });

    test('Eligible tier', () {
      expect(
        cartItem.eligibleComboDealQtyTier,
        ComboDealQtyTier.empty().copyWith(
          rate: 0.0,
          type: DiscountType('%'),
          conditionNumber: '0015958909',
          minQty: 6,
          suffix: '1',
        ),
      );
      expect(cartItem.eligibleComboDealSKUTier, ComboDealSKUTier.empty());
      expect(cartItem.eligibleComboDealTierRule, ComboDealTierRule.empty());
    });

    test('Combo rate', () {
      expect(
        cartItem.comboDealRate(material: percentDealMaterial),
        DiscountInfo(type: DiscountType('%'), rate: -5.0),
      );
      expect(
        cartItem.comboDealRate(material: amountDealMaterial),
        DiscountInfo(type: DiscountType('USD'), rate: -5.0),
      );
      expect(
        cartItem.comboDealRate(material: invalidDealMaterial),
        DiscountInfo(type: DiscountType(''), rate: -5.0),
      );
    });

    test('List price', () {
      expect(cartItem.listPrice, 700.0);
    });

    test('Unit price', () {
      const unitPrice = 95.0 * 1 + -5 * 5 + 100;
      expect(cartItem.unitPrice, unitPrice);
      expect(cartItem.grandTotalPrice(), unitPrice);
      expect(cartItem.subTotalPrice(), unitPrice);
    });
  });
}
