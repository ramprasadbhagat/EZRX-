import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ComboDetailNextDealInfo extends StatelessWidget {
  const ComboDetailNextDealInfo({
    Key? key,
    required this.totalQty,
    required this.comboDeal,
  }) : super(key: key);
  final int totalQty;
  final ComboDeal comboDeal;

  bool get _isBestDealAvailable => comboDeal.isBestDealAvailableOnCombo(
        totalQty: totalQty,
      );

  DiscountInfo get _buyMoreInfo =>
      comboDeal.getNextEligibleComboDiscount(totalQty);

  @override
  Widget build(BuildContext context) {
    if (!comboDeal.isNextComboDealVisible) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(left: 14, top: 8),
      decoration: BoxDecoration(
        color: _isBestDealAvailable
            ? ZPColors.nextDiscountBG
            : ZPColors.bestDiscountBG,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _isBestDealAvailable
              ? const Icon(
                  Icons.bolt,
                  color: ZPColors.nextTextBg,
                  size: 18,
                )
              : const Icon(
                  Icons.thumb_up_alt_outlined,
                  color: ZPColors.bestDiscountTextBg,
                  size: 18,
                ),
          const SizedBox(width: 4),
          Text(
            _isBestDealAvailable
                ? context.tr(
                    comboDeal.buyMoreInfoKey,
                    namedArgs: {
                      'unit': comboDeal.getNextEligibleComboQty(totalQty),
                      'discount': _buyMoreInfo.rate.abs().toString(),
                    },
                  )
                : context.tr('Yay! You’ve got the best deal.'),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 10,
                  color: _isBestDealAvailable
                      ? ZPColors.nextTextBg
                      : ZPColors.bestDiscountTextBg,
                ),
          ),
        ],
      ),
    );
  }
}
