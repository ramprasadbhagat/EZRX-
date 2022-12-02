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
      mainAxisAlignment: MainAxisAlignment.center,
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
        const SizedBox(width: 10),
        ElevatedButton(
          key: const Key('onDeletePressed'),
          onPressed: onDeletePressed,
          child: const Text('Delete').tr(),
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
      key: const Key('OrderActionButtonShimmer'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoadingShimmer.withChild(
          child: ElevatedButton(
            onPressed: () {},
            child: const SizedBox(),
          ),
        ),
        const SizedBox(
          width: 10,
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
