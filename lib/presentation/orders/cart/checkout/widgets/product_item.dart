import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/item_tax.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutProductItem extends StatelessWidget {
  final PriceAggregate cartItem;
  const CheckoutProductItem({required this.cartItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
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
      padding: const EdgeInsets.all(8.0),
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
          padding: const EdgeInsets.all(12),
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
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.height * 0.06,
          ),
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
              _OrderTag(cartItem: cartItem),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              cartItem.materialInfo.materialDescription,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'MYR 11,200.00 ',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.darkGray,
                    decoration: TextDecoration.lineThrough,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: 'MYR 11,000.00',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.extraLightGrey4,
                        decoration: TextDecoration.none,
                      ),
                ),
              ],
            ),
          ),
          Text(
            'Requested counter offer',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: ZPColors.extraLightGrey4,
                ),
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
  final PriceAggregate cartItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isUpdatingStock != current.isUpdatingStock &&
          !current.isUpdatingStock,
      builder: (context, state) {
        final finalCartItem = state.cartProducts.firstWhere(
          (element) => element.getMaterialNumber == cartItem.getMaterialNumber,
          orElse: () => PriceAggregate.empty(),
        );

        return finalCartItem.inStock ||
                finalCartItem.stockInfoList.isEmpty ||
                state.isFetching ||
                state.isFetchingCartProductDetail
            ? const SizedBox.shrink()
            : StatusLabel(
                status: finalCartItem.productTag,
                valueColor: finalCartItem.productTag.displayStatusTextColor,
              );
      },
    );
  }
}

class _QuantityAndPrice extends StatelessWidget {
  final PriceAggregate cartItem;
  const _QuantityAndPrice({required this.cartItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showTaxBreakdown =
        context.read<SalesOrgBloc>().state.configs.displayItemTaxBreakdown;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Qty: ${cartItem.quantity}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PriceComponent(
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                price: cartItem.finalPriceTotal.toString(),
              ),
              if (showTaxBreakdown)
                ItemTax(
                  cartItem: cartItem,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
