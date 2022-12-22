import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderActionButton extends StatelessWidget {
  final VoidCallback onAddToCartPressed;
  final VoidCallback onDeletePressed;
  final bool enableAddToCart;
  final bool isLoading;
  const OrderActionButton({
    Key? key,
    required this.onAddToCartPressed,
    required this.onDeletePressed,
    required this.enableAddToCart,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const _ActionButtonShimmer();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          key: const Key('onAddToCartPressed'),
          onPressed: enableAddToCart ? onAddToCartPressed : () {},
          style: enableAddToCart
              ? null
              : ElevatedButton.styleFrom(
                  backgroundColor: ZPColors.darkGray,
                ),
          child: const Text('Add to Cart').tr(),
        ),
        ElevatedButton(
          key: const Key('onDeletePressed'),
          onPressed: onDeletePressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => ZPColors.white,
            ),
            side: MaterialStateProperty.resolveWith(
              (states) => const BorderSide(color: ZPColors.primary),
            ),
          ),
          child: const Text(
            'Delete',
            style: TextStyle(color: ZPColors.primary),
          ).tr(),
        ),
      ],
    );
  }
}

class _ActionButtonShimmer extends StatelessWidget {
  const _ActionButtonShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const Key('orderActionButtonShimmer'),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LoadingShimmer.withChild(
          child: ElevatedButton(
            onPressed: () {},
            child: const SizedBox(),
          ),
        ),
        LoadingShimmer.withChild(
          child: ElevatedButton(
            onPressed: () {},
            child: const SizedBox(),
          ),
        ),
      ],
    );
  }
}
