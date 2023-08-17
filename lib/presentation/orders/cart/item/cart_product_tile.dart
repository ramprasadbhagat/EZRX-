import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottomsheet.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

class CartProductTile extends StatelessWidget {
  final PriceAggregate cartItem;
  const CartProductTile({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: CustomSlidable(
        extentRatio: 0.24,
        endActionPaneActions: [
          CustomSlidableAction(
            label: '',
            icon: Icons.delete_outline,
            onPressed: (v) {
              context.read<CartBloc>().add(
                    CartEvent.upsertCart(
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<CustomerCodeBloc>().state.shipToInfo,
                      priceAggregate: cartItem,
                      quantity: 0,
                      salesOrganisationConfigs:
                          context.read<SalesOrgBloc>().state.configs,
                      counterOfferDetails: RequestCounterOfferDetails.empty(),
                    ),
                  );
              context
                  .read<PriceOverrideBloc>()
                  .add(const PriceOverrideEvent.initialized());
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
  const _MaterialDetailsSection({Key? key, required this.cartItem})
      : super(key: key);

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
          _MaterialDetails(cartItem: cartItem),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Item subtotal:'.tr(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: ZPColors.darkGray,
                ),
          ),
          LoadingShimmer.withChild(
            enabled: context.read<CartBloc>().state.isMappingPrice ||
                context.read<CartBloc>().state.isUpserting ||
                context.read<CartBloc>().state.isUpdatingStock ||
                context.read<MaterialPriceBloc>().state.isFetching,
            child: PriceComponent(
              salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
              price: cartProduct.finalPriceTotal.toString(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final PriceAggregate cartItem;
  const _MaterialDetails({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCounterOfferRequested = cartItem.price.isPriceOverride;

    return BlocListener<PriceOverrideBloc, PriceOverrideState>(
      listenWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      listener: (context, state) {
        context.read<CartBloc>().add(
              CartEvent.updatePriceProduct(
                priceProducts:
                    context.read<MaterialPriceBloc>().state.materialPrice,
                overriddenProductPrice: state.overriddenMaterialPrice,
                salesOrganisationConfigs:
                    context.read<SalesOrgBloc>().state.configs,
                salesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                customerCodeInfo:
                    context.read<CustomerCodeBloc>().state.customerCodeInfo,
                shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
              ),
            );
      },
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  cartItem.materialInfo.materialNumber.displayMatNo,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                ),
                const SizedBox(
                  width: 4,
                ),
                StatusLabel(
                  status: cartItem.productTag,
                  valueColor: cartItem.productTag.displayStatusTextColor,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                cartItem.materialInfo.materialDescription,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Row(
              children: [
                isCounterOfferRequested
                    ? PriceComponent(
                        salesOrgConfig:
                            context.read<SalesOrgBloc>().state.configs,
                        price: cartItem.price.lastPrice
                            .getOrDefaultValue(0)
                            .toString(),
                      type: PriceStyle.counterOfferPrice,
                      )
                    : const SizedBox.shrink(),
                PriceComponent(
                  salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                  price:
                      cartItem.price.finalPrice.getOrDefaultValue(0).toString(),
                ),
              ],
            ),
            isCounterOfferRequested
                ? Text(
                    'Requested counter offer'.tr(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: ZPColors.extraLightGrey4,
                        ),
                  )
                : const SizedBox.shrink(),
            _MaterialQuantitySection(cartItem: cartItem),
          ],
        ),
      ),
    );
  }
}

class _MaterialQuantitySection extends StatefulWidget {
  final PriceAggregate cartItem;
  const _MaterialQuantitySection({Key? key, required this.cartItem})
      : super(key: key);

  @override
  State<_MaterialQuantitySection> createState() =>
      _MaterialQuantitySectionState();
}

class _MaterialQuantitySectionState extends State<_MaterialQuantitySection> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.value = TextEditingValue(
      text: widget.cartItem.quantity.toString(),
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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Focus(
        child: CartItemQuantityInput(
          isEnabled: true,
          quantityAddKey: WidgetKeys.cartItemAddKey,
          quantityDeleteKey: WidgetKeys.cartItemDeleteKey,
          quantityTextKey: WidgetKeys.quantityInputTextKey,
          controller: _controller,
          onFieldChange: (value) {},
          minusPressed: (k) {
            context.read<CartBloc>().add(
                  CartEvent.upsertCart(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    priceAggregate: widget.cartItem,
                    quantity: k,
                    salesOrganisationConfigs:
                        context.read<SalesOrgBloc>().state.configs,
                    counterOfferDetails: RequestCounterOfferDetails.empty(),
                  ),
                );
          },
          addPressed: (k) {
            context.read<CartBloc>().add(
                  CartEvent.upsertCart(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    priceAggregate: widget.cartItem,
                    quantity: k,
                    salesOrganisationConfigs:
                        context.read<SalesOrgBloc>().state.configs,
                    counterOfferDetails: RequestCounterOfferDetails.empty(),
                  ),
                );
          },
          onSubmit: (value) {
            context.read<CartBloc>().add(
                  CartEvent.upsertCart(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    priceAggregate: widget.cartItem,
                    quantity: value,
                    salesOrganisationConfigs:
                        context.read<SalesOrgBloc>().state.configs,
                    counterOfferDetails: RequestCounterOfferDetails.empty(),
                  ),
                );
          },
          isLoading: context.read<CartBloc>().state.isUpserting,
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          context.read<EligibilityBloc>().state.isBonusSampleItemVisible
              ? TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: ZPColors.extraDarkGreen,
                  ),
                  label: Text(
                    'Bonus/sample item'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.extraDarkGreen),
                  ),
                )
              : const SizedBox.shrink(),
          context.read<EligibilityBloc>().state.isCounterOfferVisible
              ? TextButton.icon(
                  onPressed: () {
                    context
                        .read<PriceOverrideBloc>()
                        .add(const PriceOverrideEvent.initialized());
                    showModalBottomSheet(
                      isDismissible: false,
                      context: context,
                      isScrollControlled: true,
                      builder: (_) {
                        return RequestCounterOfferSheet(
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
                    'Counter offer'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.extraDarkGreen),
                  ),
                )
              : const SizedBox.shrink(),
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
              padding: const EdgeInsets.all(12),
              child: CachedNetworkImage(
                imageUrl: state
                        .additionInfo[cartProduct.materialInfo.materialNumber]
                        ?.productImages
                        .first
                        .thumbNail ??
                    '',
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.height * 0.06,
                placeholder: (context, url) {
                  return LoadingShimmer.withChild(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                        ),
                        color: ZPColors.white,
                      ),
                      width: MediaQuery.of(context).size.height * 0.06,
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return SvgPicture.asset(
                    'assets/svg/default_product_image.svg',
                    key: WidgetKeys.cartProductImage,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.height * 0.06,
                  );
                },
              ),
            );
          },
        ),
        cartProduct.price.isBonusDealEligible
            ? const _OfferTag()
            : const SizedBox.shrink(),
      ],
    );
  }
}

class _OfferTag extends StatelessWidget {
  const _OfferTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: const BoxDecoration(
        color: ZPColors.darkYellow,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: const Icon(
        Icons.local_offer_outlined,
        color: ZPColors.white,
      ),
    );
  }
}

