import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    final userCanCreateOrder =
        context.read<UserBloc>().state.userCanCreateOrder;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (userCanCreateOrder)
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
        OutlinedButton(
          key: const Key('onDeletePressed'),
          onPressed: onDeletePressed,
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
