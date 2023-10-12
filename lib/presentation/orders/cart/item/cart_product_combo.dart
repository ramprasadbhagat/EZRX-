import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo_item.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

class CartProductCombo extends StatelessWidget {
  final PriceAggregate cartItem;
  const CartProductCombo({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: CustomCard(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ProductTag.comboOffer(),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit_outlined,
                    size: 18,
                    color: ZPColors.extraDarkGreen,
                  ),
                  label: Text(
                    context.tr('Edit'),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.extraDarkGreen),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 18,
                    color: ZPColors.extraDarkGreen,
                  ),
                  label: Text(
                    context.tr('Delete'),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.extraDarkGreen),
                  ),
                ),
              ],
            ),
            //TODO: Change for other's cases
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Combo K1',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    'Purchase all items with min. of its quantity.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.darkGray,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...cartItem.comboMaterials
                      .map(
                        (e) => CartProductComboItem(comboMaterialItem: e),
                      )
                      .toList(),
                ],
              ),
            ),
            const Divider(
              indent: 0,
              endIndent: 0,
              color: ZPColors.accentColor,
            ),
            _ComboSubTotalSection(
              cartProduct: cartItem,
            ),
          ],
        ),
      ),
    );
  }
}

class _ComboSubTotalSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _ComboSubTotalSection({
    required this.cartProduct,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.tr('Combo subtotal (excl. tax):'),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: ZPColors.darkGray,
                ),
          ),
          PriceComponent(
            key: WidgetKeys.cartItemProductTotalPrice,
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: cartProduct.comboSubTotalExclTax.toString(),
            type: PriceStyle.comboSubTotalExclTax,
          ),
        ],
      ),
    );
  }
}
