import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/item_tax.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/pre_order_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutMaterialItem extends StatelessWidget {
  final PriceAggregate cartItem;
  const CheckoutMaterialItem({required this.cartItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.cartItemProductTile(
        cartItem.materialInfo.materialNumber.displayMatNo,
      ),
      showBorder: true,
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          _ProductDetailsSection(
            cartItem: cartItem,
          ),
          _QuantityAndPrice(cartItem: cartItem),
        ],
      ),
    );
  }
}

class _ProductDetailsSection extends StatelessWidget {
  final PriceAggregate cartItem;
  const _ProductDetailsSection({Key? key, required this.cartItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductImageSection(
            cartProduct: cartItem,
          ),
          const SizedBox(
            width: 8,
          ),
          _ProductDetails(cartItem: cartItem),
        ],
      ),
    );
  }
}

class _ProductImageSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _ProductImageSection({Key? key, required this.cartProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCard(
          showShadow: false,
          showBorder: true,
          child: CustomImage(
            imageUrl: context
                    .read<CartBloc>()
                    .state
                    .additionInfo[cartProduct.materialInfo.materialNumber]
                    ?.productImages
                    .first
                    .thumbNail ??
                '',
            fit: BoxFit.fitHeight,
          ),
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

class _ProductDetails extends StatelessWidget {
  final PriceAggregate cartItem;
  const _ProductDetails({required this.cartItem, Key? key}) : super(key: key);

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
                  cartItem.materialInfo.combinationCode(
                    showGMCPart: context
                        .read<EligibilityBloc>()
                        .state
                        .salesOrgConfigs
                        .enableGMC,
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
                width: 8,
              ),
              PreOrderLabel(inStock: cartItem.inStock),
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
            key: WidgetKeys.cartItemProductUnitPrice,
            children: [
              if (cartItem.displayCutOffListPrice)
                PriceComponent(
                  key: WidgetKeys.materialListPriceStrikeThrough,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartItem.display(PriceType.listPrice),
                  type: PriceStyle.counterOfferPrice,
                ),
              _DisplayMaterialDetails(
                child: PriceComponent(
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartItem.display(PriceType.finalPrice),
                ),
              ),
            ],
          ),
          if (cartItem.price.isCounterOfferRequested)
            Text(
              context.tr('Requested counter offer'),
              key: WidgetKeys.cartItemProductCounterOfferLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: ZPColors.extraLightGrey4,
                  ),
            ),
          GovtListPriceComponent(
            price: cartItem.display(PriceType.listPrice),
          ),
        ],
      ),
    );
  }
}

class _QuantityAndPrice extends StatelessWidget {
  final PriceAggregate cartItem;
  const _QuantityAndPrice({required this.cartItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: BlocBuilder<CartBloc, CartState>(
        buildWhen: (previous, current) =>
            previous.aplSimulatorOrder != current.aplSimulatorOrder,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _DisplayMaterialDetails(
                child: Text(
                  '${context.tr('Qty')}: ${cartItem.quantity}',
                  key: WidgetKeys.cartItemProductQty,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ),
              Column(
                key: WidgetKeys.cartItemProductTotalPrice,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _DisplayMaterialDetails(
                    child: PriceComponent(
                      salesOrgConfig:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                      price: cartItem.finalCheckoutTotalForAllMaterial,
                    ),
                  ),
                  if (cartItem.showTaxBreakDown)
                    ItemTax(
                      cartItem: cartItem,
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DisplayMaterialDetails extends StatelessWidget {
  const _DisplayMaterialDetails({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isCartDetailsFetching != current.isCartDetailsFetching,
      builder: (context, state) {
        if (state.isCartDetailsFetching) {
          return SizedBox(
            width: Responsive.isLargerThan(
              context,
              Breakpoint.desktop,
            )
                ? MediaQuery.of(context).size.width * 0.2
                : MediaQuery.of(context).size.width * 0.3,
            child: LoadingShimmer.tile(),
          );
        }

        return child;
      },
    );
  }
}
