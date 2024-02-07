import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/item_tax.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/order_tag.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/presentation/orders/cart/bonus/bonus_items_sheet.dart';

part 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_widgets/invalid_material_message.dart';

class CartProductTile extends StatelessWidget {
  final PriceAggregate cartItem;

  const CartProductTile({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderEligibilityState = context.read<OrderEligibilityBloc>().state;
    final isOOSNotAllowed =
        !cartItem.inStock && !orderEligibilityState.isOOSAllowedIfPresentInCart;
    final isMWPNotAllowed = cartItem.price.finalPrice.isEmpty &&
        orderEligibilityState.isMWPNotAllowedAndPresentInCart;
    final isSuspended = cartItem.materialInfo.isSuspended ||
        cartItem.materialInfo.isPrincipalSuspended;
    final isInvalidCartItem = isSuspended || isOOSNotAllowed || isMWPNotAllowed;

    return Padding(
      key: WidgetKeys.cartItemProductTile(
        cartItem.materialInfo.materialNumber.displayMatNo,
      ),
      padding: const EdgeInsets.only(top: 25.0),
      child: CustomSlidable(
        extentRatio: 0.24,
        endActionPaneActions: [
          CustomSlidableAction(
            key: WidgetKeys.cartItemSwipeDeleteButton,
            label: '',
            icon: Icons.delete_outline,
            onPressed: (v) {
              context.read<CartBloc>().add(
                    CartEvent.upsertCart(
                      priceAggregate: cartItem.copyWith(quantity: 0),
                    ),
                  );
              context.read<PriceOverrideBloc>().add(
                    const PriceOverrideEvent.initialized(),
                  );
            },
          ),
        ],
        borderRadius: 8,
        child: CustomCard(
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              _MaterialDetailsSection(
                cartItem: cartItem,
                isInvalidCartItem: isInvalidCartItem,
              ),
              const Divider(
                indent: 0,
                endIndent: 0,
                color: ZPColors.accentColor,
              ),
              _ItemSubTotalSection(
                cartProduct: cartItem,
              ),
              const Divider(
                indent: 0,
                endIndent: 0,
                color: ZPColors.accentColor,
              ),
              if (!isInvalidCartItem)
                _BonusPriceCounterSection(
                  cartItem: cartItem,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  final PriceAggregate cartItem;
  final bool isInvalidCartItem;

  const _MaterialDetailsSection({
    Key? key,
    required this.cartItem,
    required this.isInvalidCartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MaterialImageSection(cartProduct: cartItem),
          const SizedBox(
            width: 8,
          ),
          _MaterialDetails(
            cartItem: cartItem,
            isInvalidCartItem: isInvalidCartItem,
          ),
        ],
      ),
    );
  }
}

class _ItemSubTotalSection extends StatelessWidget {
  final PriceAggregate cartProduct;

  const _ItemSubTotalSection({
    required this.cartProduct,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: ZPColors.darkGray,
        );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
            bottom: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr('Item subtotal:'),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: ZPColors.darkGray,
                    ),
              ),
              _LoadingShimmerWithChild(
                child: PriceComponent(
                  key: WidgetKeys.cartItemProductTotalPrice,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartProduct.finalPriceTotalForAllMaterial,
                ),
              ),
            ],
          ),
        ),
        if (cartProduct.showTaxBreakDown)
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Total with tax:'.tr(),
                  style: txtStyle,
                ),
                _LoadingShimmerWithChild(
                  child: ItemTax(
                    cartItem: cartProduct,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _LoadingShimmerWithChild extends StatelessWidget {
  const _LoadingShimmerWithChild({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LoadingShimmer.withChild(
      enabled: context.read<CartBloc>().state.isMappingPrice ||
          context.read<CartBloc>().state.isUpserting ||
          context.read<CartBloc>().state.isUpdatingStock ||
          context.read<MaterialPriceBloc>().state.isFetching,
      child: child,
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final PriceAggregate cartItem;
  final bool isInvalidCartItem;

  const _MaterialDetails({
    Key? key,
    required this.cartItem,
    required this.isInvalidCartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartState = context.read<CartBloc>().state;
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  cartItem.materialInfo.combinationCode(
                    showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
                  ),
                  key: WidgetKeys.cartItemProductMaterialNumber,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              OrderTag(cartItem: cartItem),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              cartItem.materialInfo.materialDescription,
              key: WidgetKeys.cartItemProductMaterialDescription,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Row(
            children: [
              if (cartItem.displayCutOffListPrice)
                PriceComponent(
                  key: WidgetKeys.cartItemCutOffListPrice,
                  salesOrgConfig: eligibilityState.salesOrgConfigs,
                  price: cartItem.display(PriceType.listPrice),
                  type: PriceStyle.counterOfferPrice,
                ),
              LoadingShimmer.withChild(
                enabled: cartState.priceUnderLoadingShimmer ||
                    context.read<MaterialPriceBloc>().state.isFetching,
                child: PriceComponent(
                  key: WidgetKeys.cartItemProductUnitPrice,
                  salesOrgConfig: eligibilityState.salesOrgConfigs,
                  price: cartItem.display(PriceType.finalPrice),
                ),
              ),
            ],
          ),
          if (cartItem.price.isCounterOfferRequested)
            Text(
              context.tr('Requested counter offer'),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: ZPColors.extraLightGrey4,
                  ),
            ),
          GovtListPriceComponent(
            price: cartItem.display(PriceType.listPrice),
          ),
          _MaterialQuantitySection(
            cartItem: cartItem,
            isInvalidCartItem: isInvalidCartItem,
          ),
          if (cartItem.showErrorMessage)
            ErrorTextWithIcon(
              textPadding: const EdgeInsets.symmetric(vertical: 2),
              valueText: cartItem.isMaxQtyExceedsForId
                  ? '${context.tr('Maximum order qty')}: ${cartItem.maximumQty}'
                  : '${context.tr('Remaining stock')}: ${cartItem.stockQuantity}',
            ),
        ],
      ),
    );
  }
}

class _MaterialQuantitySection extends StatefulWidget {
  final PriceAggregate cartItem;
  final bool isInvalidCartItem;

  const _MaterialQuantitySection({
    Key? key,
    required this.cartItem,
    required this.isInvalidCartItem,
  }) : super(key: key);

  @override
  State<_MaterialQuantitySection> createState() =>
      _MaterialQuantitySectionState();
}

class _MaterialQuantitySectionState extends State<_MaterialQuantitySection> {
  final _controller = TextEditingController();

  String get _qty => widget.cartItem.quantity.toString();
  Timer? _timer;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller.value = TextEditingValue(
      text: _qty,
      selection: TextSelection.collapsed(
        offset: _controller.selection.base.offset,
      ),
    );
    _focusNode.addListener(_onFocusChange);
    super.initState();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) return;
    _timer?.cancel();
    context.read<CartBloc>().add(
          CartEvent.upsertCart(
            priceAggregate: widget.cartItem.copyWith(
              quantity: int.tryParse(_controller.text) ?? 1,
            ),
          ),
        );
  }

  @override
  void didUpdateWidget(covariant _MaterialQuantitySection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_qty != _controller.text) {
      _controller.text = _qty;
      _controller.selection = TextSelection.collapsed(
        offset: widget.cartItem.quantity.toString().length,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _onTextChanged(int quantity) {
    _timer?.cancel();
    _timer = Timer(
      Duration(
        milliseconds: locator<Config>().autoSearchTimeout,
      ),
      () => context.read<CartBloc>().add(
            CartEvent.upsertCart(
              priceAggregate: widget.cartItem.copyWith(
                quantity: quantity,
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Focus(
            focusNode: _focusNode,
            child: CartItemQuantityInput(
              height: 48,
              isEnabled: !widget.isInvalidCartItem,
              quantityAddKey: WidgetKeys.cartItemAddKey,
              quantityDeleteKey: WidgetKeys.cartItemDeleteKey,
              quantityTextKey: WidgetKeys.quantityInputTextKey,
              controller: _controller,
              onFieldChange: (value) => _onTextChanged(value),
              minusPressed: (k) {
                context.read<CartBloc>().add(
                      CartEvent.upsertCart(
                        priceAggregate: widget.cartItem.copyWith(
                          quantity: k,
                        ),
                      ),
                    );
              },
              addPressed: (k) {
                context.read<CartBloc>().add(
                      CartEvent.upsertCart(
                        priceAggregate: widget.cartItem.copyWith(
                          quantity: k,
                        ),
                      ),
                    );
              },
              onSubmit: (value) {},
              isLoading: context.read<CartBloc>().state.isUpserting &&
                  !widget.isInvalidCartItem,
            ),
          ),
          if (!context.read<CartBloc>().state.priceUnderLoadingShimmer)
            _InvalidMaterialMessage(
              cartItem: widget.cartItem,
            ),
        ],
      ),
    );
  }
}

class _BonusPriceCounterSection extends StatelessWidget {
  final PriceAggregate cartItem;

  const _BonusPriceCounterSection({Key? key, required this.cartItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final isMYPnGSalesRepEligible = eligibilityState.isMYExternalSalesRepUser &&
        cartItem.materialInfo.isPnGPrinciple &&
        cartItem.isEligibleForAdditionalBonus;

    final isBonusOverrideEnable = eligibilityState.isBonusSampleItemVisible &&
        (cartItem.isBonusEligibleForNonMYPnGSalesRep ||
            isMYPnGSalesRepEligible);

    final isCounterOfferEnable = eligibilityState.isCounterOfferVisible &&
        !cartItem.materialInfo.hidePrice;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isBonusOverrideEnable)
            Flexible(
              child: FittedBox(
                child: TextButton.icon(
                  key: WidgetKeys.bonusSampleItemButtonKey,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      constraints: BoxConstraints.loose(
                        Size(
                          MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.80,
                        ),
                      ),
                      builder: (_) {
                        return BonusItemsSheet(cartProduct: cartItem);
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: ZPColors.extraDarkGreen,
                  ),
                  label: Text(
                    context.tr('Bonus/sample item'),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.extraDarkGreen),
                  ),
                ),
              ),
            ),
          if (isCounterOfferEnable)
            Flexible(
              child: FittedBox(
                child: TextButton.icon(
                  key: WidgetKeys.counterOfferPriceButtonKey,
                  onPressed: () {
                    context
                        .read<PriceOverrideBloc>()
                        .add(PriceOverrideEvent.setProduct(item: cartItem));
                    showModalBottomSheet(
                      isDismissible: false,
                      context: context,
                      isScrollControlled: true,
                      builder: (_) {
                        return RequestCounterOfferBottomSheet(
                          cartItem: cartItem,
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.swap_horiz_sharp,
                    color: ZPColors.extraDarkGreen,
                  ),
                  label: Text(
                    context.tr('Counter offer'),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.extraDarkGreen),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final PriceAggregate cartProduct;

  const _MaterialImageSection({required this.cartProduct, Key? key})
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
                imageUrl: state
                        .additionInfo[cartProduct.materialInfo.materialNumber]
                        ?.productImages
                        .first
                        .thumbNail ??
                    '',
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.height * 0.10,
              ),
            );
          },
        ),
        OfferLabel(
          materialInfo: cartProduct.materialInfo,
          iconOnly: true,
        ),
        if (cartProduct.materialInfo.isFOCMaterial)
          const Positioned(
            bottom: 20,
            child: CovidTag(),
          ),
      ],
    );
  }
}
