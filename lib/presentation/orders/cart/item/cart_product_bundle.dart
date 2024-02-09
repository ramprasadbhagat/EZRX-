import 'package:collection/collection.dart';
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
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/pre_order_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductBundle extends StatelessWidget {
  final PriceAggregate cartItem;
  const CartProductBundle({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSlidable(
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
      child: CustomCard(
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
  const _BundleDetailsSection({Key? key, required this.cartItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentBundleOffer = context
        .read<CartBloc>()
        .state
        .currentBundleOffer(bundleCode: cartItem.bundle.bundleCode);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cartItem.bundle.bundleCode,
                key: WidgetKeys.cartItemBundleNumber,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              Text(
                '${context.tr('Total quantity: ')}${context.read<CartBloc>().state.getTotalQuantityOfProductBundle(bundleCode: cartItem.bundle.bundleCode)}',
                key: WidgetKeys.cartItemBundleQty,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
          Text(
            cartItem.bundle.bundleName.getValue(),
            key: WidgetKeys.cartItemBundleName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          RichText(
            text: TextSpan(
              text:
                  '${currentBundleOffer.type.getValue()} ${currentBundleOffer.rate} ${context.tr('per item')}',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                    decoration: TextDecoration.none,
                  ),
              children: <TextSpan>[
                if (cartItem.isBundleMinimumQuantitySatisfies)
                  TextSpan(
                    text:
                        '${currentBundleOffer.type.getValue()} ${cartItem.bundle.bundleInformation.firstOrNull?.rate} ${context.tr('per item')}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.darkGray,
                          decoration: TextDecoration.lineThrough,
                        ),
                  ),
              ],
            ),
          ),
          if (cartItem.isBundleMinimumQuantitySatisfies)
            Text(
              '${context.tr('Purchase')} ${currentBundleOffer.quantity} ${context.tr('or more for')} ${currentBundleOffer.type.getValue()} ${currentBundleOffer.rate} ${context.tr('per item')}',
              key: WidgetKeys.cartItemBundleRate,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.darkGray,
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
  const _AllMaterialItem({Key? key, required this.cartItem}) : super(key: key);

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
    Key? key,
    required this.cartItem,
    required this.bundle,
  }) : super(key: key);

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
    Key? key,
    required this.cartItem,
    required this.bundle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  cartItem.combinationCode(
                    showGMCPart: context
                        .read<EligibilityBloc>()
                        .state
                        .salesOrgConfigs
                        .enableGMC,
                  ),
                  key: WidgetKeys.cartItemProductMaterialNumber,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              PreOrderLabel(inStock: cartItem.inStock),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              cartItem.materialDescription,
              key: WidgetKeys.cartItemProductMaterialDescription,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ZPColors.neutralsBlack),
            ),
          ),
          Text(
            cartItem.principalData.principalName.getValue(),
            key: WidgetKeys.cartItemProductPrincipalName,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10.0,
                  color: ZPColors.extraLightGrey4,
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
    Key? key,
    required this.cartItem,
    required this.bundle,
  }) : super(key: key);

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
        .getTotalQuantityOfProductBundle(bundleCode: widget.bundle.bundleCode);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CartItemQuantityInput(
                  isEnabled: true,
                  quantityAddKey: WidgetKeys.cartItemAddKey,
                  quantityDeleteKey: WidgetKeys.cartItemDeleteKey,
                  quantityTextKey: WidgetKeys.quantityInputTextKey,
                  controller: _controller,
                  onFieldChange: (value) {},
                  minusPressed: (k) => _callCartUpsertItemsEvent(quantity: k),
                  addPressed: (k) => _callCartUpsertItemsEvent(quantity: k),
                  onSubmit: (value) =>
                      _callCartUpsertItemsEvent(quantity: value),
                  isLoading: context.read<CartBloc>().state.isUpserting &&
                      _qty != _controller.text,
                  minimumQty: totalQuantityOfProductBundle >
                          (widget.bundle.bundleInformation.firstOrNull
                                  ?.quantity ??
                              1)
                      ? 1
                      : totalQuantityOfProductBundle,
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
      ),
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
  const _ConfirmButton({Key? key, required this.confirmFunction})
      : super(key: key);

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
                  backgroundColor: const MaterialStatePropertyAll(
                    ZPColors.white,
                  ),
                  shape: const MaterialStatePropertyAll(
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
                  backgroundColor: const MaterialStatePropertyAll(
                    ZPColors.primary,
                  ),
                  shape: const MaterialStatePropertyAll(
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.tr('Bundle subtotal:'),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: ZPColors.darkGray,
                ),
          ),
          PriceComponent(
            key: WidgetKeys.cartItemBundleTotalPrice,
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: context
                .read<CartBloc>()
                .state
                .itemBundlePrice(bundleCode: cartProduct.bundle.bundleCode)
                .toString(),
          ),
        ],
      ),
    );
  }
}
