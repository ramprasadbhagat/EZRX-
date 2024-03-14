import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';

import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/custom_card.dart';

import 'package:ezrxmobile/presentation/core/product_image.dart';

import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';

import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';

import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';

class BonusMaterialTile extends StatelessWidget {
  final MaterialInfo bonusMaterial;
  final PriceAggregate cartProduct;

  const BonusMaterialTile({
    Key? key,
    required this.bonusMaterial,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.bonusSampleSheetItemTile,
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MaterialImageSection(bonusMaterial: bonusMaterial),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  bonusMaterial.combinationCode(
                    showGMCPart: context
                        .read<EligibilityBloc>()
                        .state
                        .salesOrgConfigs
                        .enableGMC,
                  ),
                  key: WidgetKeys.bonusSampleSheetItemMaterialNumber,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    bonusMaterial.displayDescription,
                    key: WidgetKeys.bonusSampleSheetItemMaterialDescription,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                StockInfoWidget(
                  materialInfo: cartProduct.materialInfo,
                  stockInfo: bonusMaterial.bundleStockInfoValid,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _MaterialQuantitySection(
                        bonusItem: bonusMaterial,
                        cartProduct: cartProduct,
                      ),
                    ),
                    const SizedBox(width: 15),
                    _CartIcon(
                      bonusItem: bonusMaterial,
                      cartProduct: cartProduct,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final MaterialInfo bonusMaterial;
  const _MaterialImageSection({
    required this.bonusMaterial,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductImageBloc, ProductImageState>(
      buildWhen: (previous, current) =>
          previous.productImageMap != current.productImageMap,
      builder: (context, state) {
        return CustomCard(
          showShadow: false,
          showBorder: true,
          child: ProductImage(
            fit: BoxFit.fitHeight,
            materialNumber: bonusMaterial.materialNumber,
          ),
        );
      },
    );
  }
}

class _MaterialQuantitySection extends StatefulWidget {
  final MaterialInfo bonusItem;
  final PriceAggregate cartProduct;
  const _MaterialQuantitySection({
    Key? key,
    required this.bonusItem,
    required this.cartProduct,
  }) : super(key: key);

  @override
  State<_MaterialQuantitySection> createState() =>
      _MaterialQuantitySectionState();
}

class _MaterialQuantitySectionState extends State<_MaterialQuantitySection> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.value = TextEditingValue(
      text: '0',
      selection: TextSelection.collapsed(
        offset: _controller.selection.base.offset,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.upsertBonusItemInProgressHashCode !=
          current.upsertBonusItemInProgressHashCode,
      builder: (context, state) {
        final isBonusMaterialLoading =
            state.upsertBonusItemInProgressHashCode.contains(
          widget.bonusItem
              .copyWith(
                parentID: widget.cartProduct.materialInfo.materialNumber
                    .getOrDefaultValue(''),
                quantity: widget.cartProduct.totalCartProductBonusQty(
                  context
                      .read<BonusMaterialBloc>()
                      .state
                      .bonusItemID(widget.bonusItem.materialNumber),
                  widget.bonusItem.quantity,
                ),
                type: MaterialInfoType(''),
              )
              .hashCode,
        );

        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CartItemQuantityInput(
            height: 40,
            isEnabled: !isBonusMaterialLoading,
            quantityAddKey: WidgetKeys.cartItemAddKey,
            quantityDeleteKey: WidgetKeys.cartItemDeleteKey,
            quantityTextKey: WidgetKeys.quantityInputTextKey,
            controller: _controller,
            onFieldChange: (value) => context.read<BonusMaterialBloc>().add(
                  BonusMaterialEvent.updateBonusItemQuantity(
                    updatedBonusItem: widget.bonusItem.copyWith(
                      quantity: MaterialQty(value),
                    ),
                  ),
                ),
            minusPressed: (k) => context.read<BonusMaterialBloc>().add(
                  BonusMaterialEvent.updateBonusItemQuantity(
                    updatedBonusItem: widget.bonusItem.copyWith(
                      quantity: MaterialQty(k),
                    ),
                  ),
                ),
            addPressed: (k) => context.read<BonusMaterialBloc>().add(
                  BonusMaterialEvent.updateBonusItemQuantity(
                    updatedBonusItem: widget.bonusItem.copyWith(
                      quantity: MaterialQty(k),
                    ),
                  ),
                ),
            onSubmit: (value) => context.read<BonusMaterialBloc>().add(
                  BonusMaterialEvent.updateBonusItemQuantity(
                    updatedBonusItem: widget.bonusItem.copyWith(
                      quantity: MaterialQty(value),
                    ),
                  ),
                ),
          ),
        );
      },
    );
  }
}

class _CartIcon extends StatelessWidget {
  final MaterialInfo bonusItem;
  final PriceAggregate cartProduct;

  const _CartIcon({
    Key? key,
    required this.bonusItem,
    required this.cartProduct,
  }) : super(key: key);

  void _addBonusMaterial(BuildContext context) {
    final bonusItemId = context
        .read<BonusMaterialBloc>()
        .state
        .bonusItemID(bonusItem.materialNumber);

    context.read<CartBloc>().add(
          CartEvent.addBonusToCartItem(
            bonusMaterial: bonusItem.copyWith(
              parentID:
                  cartProduct.materialInfo.materialNumber.getOrDefaultValue(''),
              quantity: cartProduct.totalCartProductBonusQty(
                bonusItemId,
                bonusItem.quantity,
              ),
              type: MaterialInfoType('Bonus'),
            ),
            counterOfferDetails: RequestCounterOfferDetails.empty(),
            bonusItemId: bonusItemId,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.upsertBonusItemInProgressHashCode !=
          current.upsertBonusItemInProgressHashCode,
      builder: (context, state) {
        final isBonusMaterialLoading =
            state.upsertBonusItemInProgressHashCode.contains(
          bonusItem
              .copyWith(
                parentID: cartProduct.materialInfo.materialNumber
                    .getOrDefaultValue(''),
                quantity: cartProduct.totalCartProductBonusQty(
                  context
                      .read<BonusMaterialBloc>()
                      .state
                      .bonusItemID(bonusItem.materialNumber),
                  bonusItem.quantity,
                ),
                type: MaterialInfoType('Bonus'),
              )
              .hashCode,
        );

        return Container(
          height: 40,
          width: 40,
          padding: isBonusMaterialLoading
              ? const EdgeInsets.all(8)
              : EdgeInsets.zero,
          decoration: BoxDecoration(
            color: isBonusMaterialLoading
                ? ZPColors.lightPrimary
                : ZPColors.primary,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: isBonusMaterialLoading
              ? const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: ZPColors.white,
                )
              : IconButton(
                  visualDensity: VisualDensity.compact,
                  key: WidgetKeys.cartButton,
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: ZPColors.white,
                  ),
                  onPressed: () {
                    if (bonusItem.quantity.isQtyGreaterThanZero) {
                      _addBonusMaterial(context);
                    }
                    context.read<BonusMaterialBloc>().add(
                          BonusMaterialEvent.validateBonusQuantity(
                            bonusMaterial: bonusItem,
                          ),
                        );
                  },
                ),
        );
      },
    );
  }
}
