import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';

import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';

import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';

import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

class CartProductTileBonus extends StatelessWidget {
  final PriceAggregate cartProduct;
  final BonusSampleItem bonusItem;

  const CartProductTileBonus({
    Key? key,
    required this.bonusItem,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSlidable(
      key: WidgetKeys.cartItemBonus(
        cartProduct.materialInfo.materialNumber.displayMatNo,
        bonusItem.materialNumber.displayMatNo,
      ),
      extentRatio: 0.24,
      endActionPaneActions: [
        if (context.read<EligibilityBloc>().state.isBonusSampleItemVisible)
          CustomSlidableAction(
            key: WidgetKeys.cartItemSwipeDeleteButtonForBonus,
            label: '',
            icon: Icons.delete_outline,
            onPressed: (v) => context.read<CartBloc>().add(
                  CartEvent.addBonusToCartItem(
                    bonusMaterial: MaterialInfo.empty().copyWith(
                      materialNumber: bonusItem.materialNumber,
                      parentID: cartProduct.materialInfo.materialNumber
                          .getOrDefaultValue(''),
                      quantity: MaterialQty(0),
                      type: bonusItem.type,
                    ),
                    counterOfferDetails: RequestCounterOfferDetails.empty(),
                    bonusItemId: bonusItem.itemId,
                  ),
                ),
          ),
      ],
      borderRadius: 8,
      child: CustomCard(
        margin: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            _MaterialDetailsSection(
              bonusItem: bonusItem,
              cartProduct: cartProduct,
            ),
            const _ItemSubTotalSection(),
          ],
        ),
      ),
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  final BonusSampleItem bonusItem;
  const _MaterialDetailsSection({
    Key? key,
    required this.bonusItem,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MaterialImageSection(
            bonusItem: bonusItem,
          ),
          const SizedBox(
            width: 8,
          ),
          _MaterialDetails(
            bonusItem: bonusItem,
            cartProduct: cartProduct,
          ),
        ],
      ),
    );
  }
}

class _ItemSubTotalSection extends StatelessWidget {
  const _ItemSubTotalSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
        bottom: 8,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: eligibilityState.isIDMarket
            ? PriceComponent(
                salesOrgConfig: eligibilityState.salesOrgConfigs,
                price: '0',
              )
            : Text(
                'FREE'.tr(),
                key: WidgetKeys.cartItemBonusFreeLabel,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.textButtonColor,
                    ),
              ),
      ),
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final PriceAggregate cartProduct;
  final BonusSampleItem bonusItem;
  const _MaterialDetails({
    Key? key,
    required this.bonusItem,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                bonusItem.materialNumber.displayMatNo,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
              const SizedBox(
                width: 4,
              ),
              if (!context.read<EligibilityBloc>().state.isIDMarket)
                const BonusTag(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              bonusItem.materialDescription,
              key: WidgetKeys.cartItemBonusMaterialDescription,
              maxLines: 2,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          _MaterialQuantitySection(
            bonusItem: bonusItem,
            cartProduct: cartProduct,
          ),
        ],
      ),
    );
  }
}

class _MaterialQuantitySection extends StatefulWidget {
  final PriceAggregate cartProduct;
  final BonusSampleItem bonusItem;
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
      text: widget.bonusItem.qty.getOrDefaultValue(0).toString(),
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

  String get _qty => widget.bonusItem.qty.getOrDefaultValue(0).toString();

  @override
  void didUpdateWidget(covariant _MaterialQuantitySection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_qty != _controller.text) {
      _controller.text = _qty;
      _controller.selection = TextSelection.collapsed(offset: _qty.length);
    }
  }

  void _upsertCart(BuildContext context, int qty) =>
      context.read<CartBloc>().add(
            CartEvent.addBonusToCartItem(
              bonusMaterial: MaterialInfo.empty().copyWith(
                materialNumber: widget.bonusItem.materialNumber,
                parentID: widget.cartProduct.materialInfo.materialNumber
                    .getOrDefaultValue(''),
                quantity: MaterialQty(qty),
                type: widget.bonusItem.type,
              ),
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              bonusItemId: widget.bonusItem.itemId,
            ),
          );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CartItemQuantityInput(
        isEnabled:
            context.read<EligibilityBloc>().state.isBonusSampleItemVisible,
        quantityAddKey: WidgetKeys.bonusOfferItemAddKey,
        quantityDeleteKey: WidgetKeys.bonusOfferItemDeleteKey,
        quantityTextKey: WidgetKeys.bonusOfferItemInputKey,
        controller: _controller,
        isLoading: context.read<CartBloc>().state.isUpserting,
        onFieldChange: (value) {},
        minusPressed: (k) => _upsertCart(context, k),
        addPressed: (k) => _upsertCart(context, k),
        onSubmit: (value) => _upsertCart(context, value),
        maximumQty: 99999,
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final BonusSampleItem bonusItem;
  const _MaterialImageSection({required this.bonusItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return CustomCard(
              showShadow: false,
              showBorder: true,
              child: CustomImage(
                imageUrl: state.additionInfo[bonusItem.materialNumber]
                        ?.productImages.first.thumbNail ??
                    '',
                fit: BoxFit.fitHeight,
              ),
            );
          },
        ),
      ],
    );
  }
}
