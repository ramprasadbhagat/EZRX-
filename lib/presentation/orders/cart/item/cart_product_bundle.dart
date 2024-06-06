import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/pre_order_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductBundle extends StatelessWidget {
  final PriceAggregate cartItem;
  const CartProductBundle({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.symmetric(vertical: 12),
      clipBehavior: Clip.hardEdge,
      child: CustomSlidable(
        key: WidgetKeys.cartItemBundleTile(cartItem.bundle.bundleCode),
        extentRatio: 0.24,
        endActionPaneActions: [
          CustomSlidableAction(
            key: WidgetKeys.cartItemSwipeDeleteButton,
            label: '',
            icon: Icons.delete_outline,
            onPressed: (v) {
              context.read<CartBloc>().add(
                    CartEvent.upsertCart(
                      priceAggregate: cartItem.copyWith(
                        quantity: 0,
                      ),
                    ),
                  );
            },
          ),
        ],
        borderRadius: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductTag.bundleOffer(),
            _BundleDetailsSection(
              cartItem: cartItem,
            ),
            _AllMaterialItem(
              cartItem: cartItem,
            ),
            const Divider(
              indent: 0,
              endIndent: 0,
              color: ZPColors.extraLightGrey3,
            ),
            _BundleSubTotalSection(cartProduct: cartItem),
          ],
        ),
      ),
    );
  }
}

class _BundleDetailsSection extends StatelessWidget {
  final PriceAggregate cartItem;
  const _BundleDetailsSection({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final currentBundle = context
        .read<CartBloc>()
        .state
        .findItemById(MaterialNumber(cartItem.bundle.bundleCode))
        .bundle;
    final currentBundleOffer = currentBundle.currentBundleInfo;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Text(
                cartItem.bundle.bundleCode,
                key: WidgetKeys.cartItemBundleNumber,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              Text(
                '${context.tr('Total quantity')}: ${currentBundle.totalQty}',
                key: WidgetKeys.cartItemBundleQty,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
            ],
          ),
          if (!cartItem.isBundleMinimumQuantitySatisfies)
            ErrorTextWithIcon(
              textPadding: const EdgeInsets.symmetric(vertical: 2),
              valueText: context.tr(
                'Minimum total purchase qty: ${cartItem.bundle.minimumQuantityBundleMaterial.quantity}',
              ),
            ),
          RichText(
            key: WidgetKeys.cartItemBundleName,
            text: TextSpan(
              children: [
                if (cartItem.materialInfo.isMarketPlace) ...[
                  WidgetSpan(
                    child: MarketPlaceLogo.small(),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  const WidgetSpan(child: SizedBox(width: 8)),
                ],
                TextSpan(
                  text: cartItem.bundle.bundleName.name,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ],
            ),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (currentBundle.showStrikeThroughPrice)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: PriceComponent(
                    salesOrgConfig:
                        context.read<EligibilityBloc>().state.salesOrgConfigs,
                    price: currentBundle.minimumQuantityBundleMaterial.rate
                        .toString(),
                    trailingText: context.tr('per item'),
                    type: PriceStyle.bundleListPriceStrikeThrough,
                  ),
                ),
              PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: currentBundleOffer.rate.toString(),
                type: PriceStyle.bundleCartPrice,
                trailingText: context.tr('per item'),
                key: WidgetKeys.addBundleRate,
              ),
            ],
          ),
          if (cartItem.isBundleMinimumQuantitySatisfies)
            Text(
              '${context.tr('Purchase')} ${currentBundleOffer.quantity} ${context.tr('or more for')} ${currentBundleOffer.type.getValue()} ${currentBundleOffer.rate} ${context.tr('per item')}',
              key: WidgetKeys.cartItemBundleRate,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.neutralsGrey1,
                    fontStyle: FontStyle.italic,
                  ),
            ),
        ],
      ),
    );
  }
}

class _AllMaterialItem extends StatelessWidget {
  final PriceAggregate cartItem;
  const _AllMaterialItem({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cartItem.bundle.materials
          .map(
            (e) => _MaterialDetailsSection(
              cartItem: e,
              bundle: cartItem.bundle,
            ),
          )
          .toList(),
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  final MaterialInfo cartItem;
  final Bundle bundle;
  const _MaterialDetailsSection({
    required this.cartItem,
    required this.bundle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.cartItemProductTile(
        cartItem.materialNumber.displayMatNo,
      ),
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
            bundle: bundle,
          ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final MaterialInfo cartProduct;
  const _MaterialImageSection({required this.cartProduct});

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
                imageUrl: state.additionInfo[cartProduct.materialNumber]
                        ?.productImages.first.thumbNail ??
                    '',
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.height * 0.10,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final MaterialInfo cartItem;
  final Bundle bundle;
  const _MaterialDetails({
    required this.cartItem,
    required this.bundle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                cartItem.combinationCode(
                  showGMCPart: context
                      .read<EligibilityBloc>()
                      .state
                      .salesOrgConfigs
                      .enableGMC,
                  showIRNPart: context
                      .read<EligibilityBloc>()
                      .state
                      .salesOrgConfigs
                      .enableIRN,
                ),
                key: WidgetKeys.cartItemProductMaterialNumber,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              const SizedBox(width: 4),
              PreOrderLabel(stockInfo: cartItem.productStockInfo),
            ],
          ),
          Text(
            cartItem.materialDescription,
            key: WidgetKeys.cartItemProductMaterialDescription,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: ZPColors.neutralsBlack),
          ),
          StockInfoWidget(
            stockInfo: cartItem.bundleStockInfoValid,
            materialInfo: cartItem,
          ),
          Text(
            cartItem.getManufactured,
            key: WidgetKeys.cartItemProductPrincipalName,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10.0,
                  color: ZPColors.neutralsGrey1,
                ),
          ),
          _MaterialQuantitySection(
            cartItem: cartItem,
            bundle: bundle,
          ),
        ],
      ),
    );
  }
}

class _MaterialQuantitySection extends StatefulWidget {
  final MaterialInfo cartItem;
  final Bundle bundle;
  const _MaterialQuantitySection({
    required this.cartItem,
    required this.bundle,
  });

  @override
  State<_MaterialQuantitySection> createState() =>
      _MaterialQuantitySectionState();
}

class _MaterialQuantitySectionState extends State<_MaterialQuantitySection> {
  final _controller = TextEditingController();

  String get _qty => widget.cartItem.quantity.intValue.toString();

  @override
  void initState() {
    _controller.value = TextEditingValue(
      text: _qty,
      selection: TextSelection.collapsed(
        offset: _controller.selection.base.offset,
      ),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _MaterialQuantitySection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_qty != _controller.text) {
      _controller.text = _qty;
      _controller.selection = TextSelection.collapsed(
        offset: widget.cartItem.quantity.getOrDefaultValue(0).toString().length,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalQuantityOfProductBundle = context
        .read<CartBloc>()
        .state
        .findItemById(MaterialNumber(widget.bundle.bundleCode))
        .bundle
        .totalQty;

    //Bundle minimum quantity is the first quantity which is sorted with respect to sequence.
    final bundleMinQty = totalQuantityOfProductBundle >
            widget.bundle.minimumQuantityBundleMaterial.quantity
        ? 1
        : totalQuantityOfProductBundle;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CartItemQuantityInput(
                isEnabled: true,
                quantityAddKey: WidgetKeys.increaseQuantityKey,
                quantityDeleteKey: WidgetKeys.decreaseQuantityKey,
                quantityTextKey: WidgetKeys.quantityInputTextKey,
                controller: _controller,
                onFieldChange: (value) {},
                minusPressed: (k) => _callCartUpsertItemsEvent(quantity: k),
                addPressed: (k) => _callCartUpsertItemsEvent(quantity: k),
                onSubmit: (value) => _callCartUpsertItemsEvent(quantity: value),
                isLoading: context.read<CartBloc>().state.isUpserting &&
                    _qty != _controller.text,
                minimumQty: bundleMinQty,
              ),
            ),
            IconButton(
              key: WidgetKeys.cartItemProductDeleteButton,
              onPressed: () => _showConfirmRemove(context),
              icon: const Icon(Icons.delete_outlined),
            ),
          ],
        ),
        if (!widget.cartItem.inStock &&
            context
                .read<OrderEligibilityBloc>()
                .state
                .displayInvalidOOSOnCartItem)
          ErrorTextWithIcon(
            valueText: context.tr('Material out of stock'),
          ),
      ],
    );
  }

  void _showConfirmRemove(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      useSafeArea: true,
      builder: (_) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                children: [
                  Text(
                    context.tr('Remove item from bundle?'),
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: ZPColors.primary, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    context.tr(
                      'Removing items from the bundle may result in price changes.',
                    ),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.extraLightGrey4,
                        ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  _ConfirmButton(confirmFunction: _callCartUpsertItemsEvent),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _callCartUpsertItemsEvent({
    required int quantity,
  }) {
    context.read<CartBloc>().add(
          CartEvent.upsertCartItems(
            priceAggregate: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber(
                  widget.bundle.bundleCode,
                ),
              ),
              bundle: Bundle.empty().copyWith(
                materials: [
                  widget.cartItem.copyWith(quantity: MaterialQty(quantity)),
                ],
                bundleCode: widget.bundle.bundleCode,
              ),
            ),
          ),
        );
  }
}

class _ConfirmButton extends StatelessWidget {
  final Function({required int quantity}) confirmFunction;
  const _ConfirmButton({required this.confirmFunction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: const WidgetStatePropertyAll(
                    ZPColors.white,
                  ),
                  shape: const WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      side: BorderSide(color: ZPColors.primary),
                    ),
                  ),
                ),
            child: Text(
              context.tr('Cancel'),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.primary,
                  ),
            ),
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              confirmFunction(quantity: 0);
              Navigator.of(context).pop();
            },
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: const WidgetStatePropertyAll(
                    ZPColors.primary,
                  ),
                  shape: const WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      side: BorderSide(color: ZPColors.primary),
                    ),
                  ),
                ),
            child: Text(
              context.tr('Remove'),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BundleSubTotalSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _BundleSubTotalSection({
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.tr('Bundle subtotal:'),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.neutralsGrey1,
                ),
          ),
          PriceComponent(
            key: WidgetKeys.cartItemBundleTotalPrice,
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: context
                .read<CartBloc>()
                .state
                .findItemById(MaterialNumber(cartProduct.bundle.bundleCode))
                .bundle
                .totalPrice
                .toString(),
          ),
        ],
      ),
    );
  }
}
