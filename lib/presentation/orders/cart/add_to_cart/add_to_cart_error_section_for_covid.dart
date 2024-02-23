import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddToCartErrorSection extends StatelessWidget {
  final PriceAggregate priceAggregate;
  const AddToCartErrorSection({
    Key? key,
    required this.priceAggregate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartContainsFocProduct =
        context.read<CartBloc>().state.containFocMaterialInCartProduct;

    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.isClearing != current.isClearing && !current.isClearing,
      listener: (context, cartState) {
        if (cartState.cartProducts.isNotEmpty) return;
        if (priceAggregate.materialInfo.type.typeMaterial) {
          context.read<CartBloc>().add(
                CartEvent.upsertCart(
                  priceAggregate: priceAggregate,
                ),
              );
        } else {
          context.read<CartBloc>().add(
                CartEvent.upsertCartItems(
                  priceAggregate: priceAggregate,
                ),
              );
        }

        context.router.pop();
      },
      child: SafeArea(
        key: WidgetKeys.addToCartErrorSection,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Center(
                  child: SvgPicture.asset(
                    SvgImage.alert,
                    height: 150,
                  ),
                ),
              ),
              Text(
                context.tr('Proceed to add to cart?'),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: ZPColors.primary),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: Text(
                  context.tr(
                    cartContainsFocProduct
                        ? 'Commercial materials cannot be added to cart with Covid-19 vaccines. By proceeding, your current cart will be cleared.'
                        : 'Covid-19 vaccine cannot be added to cart with other commercial materials. By proceeding, your current cart will be cleared.',
                  ),
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: ZPColors.extraLightGrey4),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      key: WidgetKeys.cancelCovidMaterialAddToCart,
                      child: Text(
                        context.tr('Cancel'),
                        key: WidgetKeys.cancelCovidMaterialAddToCart,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: ZPColors.primary),
                      ).tr(),
                      onPressed: () {
                        context.router.pop();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      key: WidgetKeys.addToCartErrorSectionProceed,
                      child: Text(
                        'Proceed'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: ZPColors.white),
                      ),
                      onPressed: () {
                        context.read<CartBloc>().add(
                              const CartEvent.clearCart(),
                            );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
