import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComboDealHeaderMessage extends StatelessWidget {
  final ComboDeal comboDeal;
  const ComboDealHeaderMessage({
    Key? key,
    required this.comboDeal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      decoration: const BoxDecoration(
        color: ZPColors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15.0,
            offset: Offset(0.0, 0.75),
          ),
        ],
      ),
      child: Text(
        _headerMessage(context),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: ZPColors.primary,
        ),
      ),
    );
  }

  String _headerMessage(BuildContext context) {
    switch (comboDeal.scheme) {
      case ComboDealScheme.k1:
        return 'You must purchase all of the product items with min. of below mentioned quantity.';
      case ComboDealScheme.k2:
        final requiredQty = comboDeal.flexiQtyTier.isEmpty
            ? 0
            : comboDeal.flexiQtyTier.first.minQty;
        return 'You must purchase a total QTY of [$requiredQty] from any product or products.';
      case ComboDealScheme.k3:
        return 'You must purchase ${comboDeal.sortedSKUTier.map((e) => '${e.minQty} unique products ').toList().join(' OR ')} WITH a min QTY of [${comboDeal.materialComboDeals.first.materials.first.minQty}] for each single product (Discounts will increase as the number of unique products increases)';
      case ComboDealScheme.k4:
      case ComboDealScheme.k4_2:
        final flexiQtyTierCopyList =
            List<ComboDealQtyTier>.from(comboDeal.flexiQtyTier);
        flexiQtyTierCopyList.sort(((a, b) => a.minQty.compareTo(b.minQty)));
        final tierText = flexiQtyTierCopyList
            .map((e) => '${e.minQty}')
            .toList()
            .join(' OR ');
        return 'You must purchase a product or products with a total QTY of $tierText. (Discounts will increase as the total quantity exceeds the minimum eligibilities)';
      case ComboDealScheme.k5:
        final tierTexts = comboDeal.descendingSortedMinAmountTiers.reversed
            .map((e) => '${e.minTotalAmount.toInt()}')
            .join(' OR ');
        final currency = comboDeal.flexiTierRule.isEmpty
            ? context
                .select<SalesOrgBloc, Currency>(
                  (value) => value.state.configs.currency,
                )
                .code
            : comboDeal.flexiTierRule.first.minTotalCurrency;
        return 'You need to reach min order value ($currency) of $tierTexts from any product or products below';
      default:
        return 'You must purchase all of the product items with min. of below mentioned quantity.';
    }
  }
}
