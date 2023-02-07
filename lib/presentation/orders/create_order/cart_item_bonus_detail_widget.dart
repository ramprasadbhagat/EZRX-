import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bonus_lable.dart';
import 'package:flutter/material.dart';

class BonusDetails extends StatelessWidget {
  final PriceAggregate cartItem;
  const BonusDetails({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cartItem.price.isBonusDealEligible) {
      return Column(
        children: [
          if (cartItem.price.sameMaterialBonus.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Bonuses',
                  style: Theme.of(context).textTheme.subtitle2,
                ).tr(),
                ...cartItem.price.sameMaterialBonus
                    .toList()
                    .reversed
                    .map((e) => BonusLabel(bonus: e))
                    .toList(),
              ],
            ),
          if (cartItem.price.otherMaterialBonus.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Click the + in the label to have the bonus details',
                  style: Theme.of(context).textTheme.subtitle2,
                ).tr(),
                ...cartItem.price.otherMaterialBonus
                    .toList()
                    .reversed
                    .map((e) => ExpandedBonusLabel(bonus: e))
                    .toList(),
              ],
            ),
        ],
      );
    }
    
    return const SizedBox.shrink();
  }
}
