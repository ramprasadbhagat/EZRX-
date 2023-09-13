import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddToCartErrorSection extends StatelessWidget {
  const AddToCartErrorSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              'Proceed to add to cart?'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: ZPColors.primary),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Text(
                'Covid-19 vaccine cannot be added to cart with other commercial materials. By proceeding, your current cart will be cleared.'
                    .tr(),
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
                    child: Text(
                      'Cancel'.tr(),
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
                    child: Text(
                      'Proceed'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: ZPColors.white),
                    ),
                    onPressed: () {
                      context.read<CartBloc>().add(const CartEvent.clearCart());
                      context.router.pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
