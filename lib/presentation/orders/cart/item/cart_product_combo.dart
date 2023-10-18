import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo_item.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

part 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_widgets/delete_combo_deals_bottom_sheet.dart';

class CartProductCombo extends StatelessWidget {
  final PriceAggregate cartItem;
  const CartProductCombo({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocListener<ComboDealListBloc, ComboDealListState>(
      listenWhen: (previous, current) =>
          (previous.isFetching != current.isFetching) &&
          !current.isFetching &&
          context.router.current.path == 'orders/cart',
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {
            if (!state.isFetching &&
                state.priceComboDeal.id ==
                    cartItem.comboMaterials.first.comboDeals.id) {
              final comboDeal = state.getComboDeal(
                comboDealId: cartItem.comboMaterials.first.comboDeals.id,
              );
              context.read<ComboDealMaterialDetailBloc>().add(
                    ComboDealMaterialDetailEvent.fetchComboDealDetail(
                      salesConfigs: eligibilityState.salesOrgConfigs,
                      comboDeal: comboDeal,
                      locale: context.locale,
                      parentMaterialNumber: MaterialNumber(
                        cartItem.comboMaterials.first.parentId,
                      ),
                      comboMaterialsCurrentQuantity:
                          cartItem.comboMaterialsCurrentQuantity,
                    ),
                  );
              context.navigateTo(const ComboDetailPageRoute());
            }
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: CustomSlidable(
          extentRatio: 0.24,
          endActionPaneActions: [
            CustomSlidableAction(
              key: WidgetKeys.cartItemSwipeDeleteButton,
              label: '',
              icon: Icons.delete_outline,
              onPressed: (v) => _showDeleteComboBottomSheet(
                context,
                cartItem: cartItem,
              ),
            ),
          ],
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
                      onPressed: () {
                        context.read<ComboDealListBloc>().add(
                              ComboDealListEvent.fetchMaterialDeal(
                                salesOrganisation:
                                    eligibilityState.salesOrganisation,
                                customerCodeInfo:
                                    eligibilityState.customerCodeInfo,
                                comboDeals:
                                    cartItem.comboMaterials.first.comboDeals,
                              ),
                            );
                      },
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
                      onPressed: () => _showDeleteComboBottomSheet(
                        context,
                        cartItem: cartItem,
                      ),
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
        ),
      ),
    );
  }

  void _showDeleteComboBottomSheet(
    BuildContext context, {
    required PriceAggregate cartItem,
  }) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => _DeleteComboDealBottomSheet(
        cartItem: cartItem,
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
