import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/cart_product.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutProductItem extends StatelessWidget {
  final CartProduct cartItem;
  const CheckoutProductItem({required this.cartItem, Key? key}) : super(key: key);

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
  final CartProduct cartItem;
  const _ProductDetailsSection({Key? key, required this.cartItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductImageSection(cartProduct: cartItem,),
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
  final CartProduct cartProduct;
  const _ProductImageSection({Key? key, required this.cartProduct}) : super(key: key);

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
                imageUrl: state.additionInfo[cartProduct.productID]
                    ?.productImages.first.thumbNail ??
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
        const _OfferTag(),
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
  final CartProduct cartItem;
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
                cartItem.productID.displayMatNo,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const _OrderTag(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              cartItem.materialDescription,
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
  const _OrderTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: const BoxDecoration(
        color: ZPColors.lightYellow,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        'Preorder',
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(fontWeight: FontWeight.w500, fontSize: 10),
      ),
    );
  }
}

class _QuantityAndPrice extends StatelessWidget {
  final CartProduct cartItem;
  const _QuantityAndPrice({required this.cartItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          RichText(
            text: TextSpan(
              text: 'MYR ',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ZPColors.primary,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (cartItem.price.finalPrice.getValue() * cartItem.quantity).toStringAsFixed(2),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



