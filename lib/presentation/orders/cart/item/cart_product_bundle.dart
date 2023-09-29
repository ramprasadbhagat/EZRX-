import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
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
      extentRatio: 0.24,
      endActionPaneActions: [
        CustomSlidableAction(
          label: '',
          icon: Icons.delete_outline,
          onPressed: (v) {
            context.read<CartBloc>().add(
                  CartEvent.upsertCart(
                    priceAggregate: cartItem,
                    quantity: 0,
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
            const _BundleOfferTag(),
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

class _BundleOfferTag extends StatelessWidget {
  const _BundleOfferTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      margin: const EdgeInsets.only(top: 8.0),
      decoration: const BoxDecoration(
        color: ZPColors.skyBlueColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.local_offer_outlined,
            color: ZPColors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            context.tr('Bundle offer'),
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontSize: 12, color: ZPColors.white),
          ),
        ],
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              Text(
                '${context.tr('Total quantity: ')}${context.read<CartBloc>().state.getTotalQuantityOfProductBundle(bundleCode: cartItem.bundle.bundleCode)}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
            ],
          ),
          Text(
            cartItem.bundle.bundleName.getValue(),
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
          Text(
            '${context.tr('Purchase')} ${currentBundleOffer.quantity} ${context.tr('or more for')} ${currentBundleOffer.type.getValue()} ${currentBundleOffer.rate} ${context.tr('per item')}',
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
              padding: const EdgeInsets.all(12),
              child: CustomImage(
                imageUrl: state.additionInfo[cartProduct.materialNumber]
                        ?.productImages.first.thumbNail ??
                    '',
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.height * 0.06,
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
              Text(
                cartItem.materialNumber.displayMatNo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              const SizedBox(
                width: 4,
              ),
              _OrderTag(cartItem: cartItem),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              cartItem.materialDescription,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ZPColors.neutralsBlack),
            ),
          ),
          Text(
            cartItem.principalData.principalName.getValue(),
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

class _OrderTag extends StatelessWidget {
  const _OrderTag({
    Key? key,
    required this.cartItem,
  }) : super(key: key);
  final MaterialInfo cartItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isUpdatingStock != current.isUpdatingStock &&
          !current.isUpdatingStock,
      builder: (context, state) {
        final configs = context.read<EligibilityBloc>().state.salesOrgConfigs;
        final materialInfoList = state.cartProducts
            .where((element) => element.materialInfo.type.typeBundle)
            .map((e) => e.bundle.materials)
            .expand((element) => element)
            .toList();
        final materialInfo = materialInfoList.firstWhere(
          (element) => element.materialNumber == cartItem.materialNumber,
          orElse: () => MaterialInfo.empty(),
        );
        if (materialInfo.stockInfos.isEmpty || materialInfo.inStock) {
          return const SizedBox.shrink();
        }

        final validateOutOfStockValue =
            context.read<EligibilityBloc>().state.validateOutOfStockValue;

        return state.isFetching || state.isFetchingCartProductDetail
            ? const SizedBox.shrink()
            : StatusLabel(
                status: StatusType(
                  configs.addOosMaterials.productTag(validateOutOfStockValue),
                ),
              );
      },
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

  @override
  void initState() {
    _controller.value = TextEditingValue(
      text: widget.cartItem.quantity.intValue.toString(),
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
    final totalQuantityOfProductBundle = context
        .read<CartBloc>()
        .state
        .getTotalQuantityOfProductBundle(bundleCode: widget.bundle.bundleCode);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
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
              onSubmit: (value) => _callCartUpsertItemsEvent(quantity: value),
              isLoading: context.read<CartBloc>().state.isUpserting &&
                  widget.cartItem.quantity.intValue.toString() !=
                      _controller.text,
              minimumQty: totalQuantityOfProductBundle >
                      (widget.bundle.bundleInformation.firstOrNull?.quantity ??
                          1)
                  ? 1
                  : totalQuantityOfProductBundle,
            ),
          ),
          IconButton(
            onPressed: () => _showConfirmRemove(context),
            icon: const Icon(Icons.delete_outlined),
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
