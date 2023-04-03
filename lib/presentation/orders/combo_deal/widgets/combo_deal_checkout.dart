import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComboDealCheckout extends StatelessWidget {
  final bool isEdit;
  final bool rateEnabled;
  final List<PriceAggregate> selectedItems;
  final ComboDeal currentDeal;
  final VoidCallback onCheckoutPressed;
  const ComboDealCheckout({
    Key? key,
    required this.isEdit,
    required this.rateEnabled,
    required this.selectedItems,
    required this.currentDeal,
    required this.onCheckoutPressed,
  }) : super(key: key);

  CartItem get cartItem => CartItem.comboDeal(selectedItems);

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
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              runSpacing: 5,
              children: [
                PriceLabel(
                  key: Key(
                    'Total label ${cartItem.unitPrice}',
                  ),
                  label: 'Total Value'.tr(),
                  salesConfigs: currentDeal.scheme == ComboDealScheme.k5
                      ? SalesOrganisationConfigs.empty().copyWith(
                          currency: Currency(
                            currentDeal.flexiTierRule.first.minTotalCurrency,
                          ),
                        )
                      : context.read<EligibilityBloc>().state.salesOrgConfigs,
                  discountPrice: cartItem.unitPrice,
                  price: cartItem.listPrice,
                  discountEnable: rateEnabled,
                ),
                const SizedBox(width: 5),
                if (rateEnabled &&
                    currentDeal.scheme != ComboDealScheme.k5 &&
                    currentDeal.scheme != ComboDealScheme.k1 &&
                    currentDeal.scheme != ComboDealScheme.k4_2)
                  DiscountLabel(
                    label: cartItem
                            .comboDealRate(material: PriceAggregate.empty())
                            ?.text ??
                        '',
                  ),
              ],
            ),
            if (currentDeal.scheme == ComboDealScheme.k5)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Wrap(
                  runSpacing: 5,
                  children:
                      currentDeal.descendingSortedMinAmountTiers.reversed.map(
                    (tier) {
                      final rateText = DiscountInfo(
                        rate: tier.discountInfo.rate.abs(),
                        type: tier.discountInfo.type,
                      ).text;

                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: DiscountLabel(
                          label: '>=${tier.minTotalAmount.toInt()} - $rateText',
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                key: const ValueKey('addToCartButton'),
                onPressed: rateEnabled ? onCheckoutPressed : null,
                child: Text(
                  isEdit ? 'Update cart'.tr() : 'Add To Cart'.tr(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
