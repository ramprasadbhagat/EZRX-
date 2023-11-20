import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ComboDetailNextDealInfo extends StatelessWidget {
  const ComboDetailNextDealInfo({
    Key? key,
    required this.totalQty,
    required this.comboDeal,
    required this.totalAmount,
  }) : super(key: key);
  final int totalQty;
  final double totalAmount;
  final ComboDeal comboDeal;

  bool get _isBestDealAvailable => comboDeal.isBestDealAvailableOnCombo(
        totalQty: totalQty,
        totalAmount: totalAmount,
      );

  DiscountInfo get _buyMoreInfo => comboDeal.getNextEligibleComboDiscount(
        totalQty: totalQty,
        totalAmount: totalAmount,
      );

  @override
  Widget build(BuildContext context) {
    if (!comboDeal.isNextComboDealVisible) return const SizedBox.shrink();

    return Container(
      key: WidgetKeys.comboNextDealInfo,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(left: 14, top: 8),
      decoration: BoxDecoration(
        color: _isBestDealAvailable
            ? ZPColors.bestDiscountBG
            : ZPColors.nextDiscountBG,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _isBestDealAvailable
              ? const Icon(
                  Icons.thumb_up_alt_outlined,
                  color: ZPColors.bestDiscountTextBg,
                  size: 18,
                )
              : const Icon(
                  Icons.bolt,
                  color: ZPColors.nextTextBg,
                  size: 18,
                ),
          const SizedBox(width: 4),
          Text(
            _isBestDealAvailable
                ? context.tr('Yay! You’ve got the best deal.')
                : context.tr(
                    comboDeal.buyMoreInfoKey,
                    namedArgs: {
                      'unit': comboDeal.buyMoreInfoUnit(
                        totalQty: totalQty,
                        totalAmount: totalAmount,
                      ),
                      'discount': _buyMoreInfo.rateDisplay,
                    },
                  ),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 10,
                  color: _isBestDealAvailable
                      ? ZPColors.bestDiscountTextBg
                      : ZPColors.nextTextBg,
                ),
          ),
        ],
      ),
    );
  }
}
