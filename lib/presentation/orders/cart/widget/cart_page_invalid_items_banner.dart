part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageInvalidItemsBanner extends StatelessWidget {
  const _CartPageInvalidItemsBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
      buildWhen: (previous, current) =>
          previous.cartContainsSuspendedMaterials !=
          current.cartContainsSuspendedMaterials,
      builder: (context, state) {
        if (!state.cartContainsSuspendedMaterials) {
          return const SizedBox.shrink();
        }

        return ColoredBox(
          color: ZPColors.paleBlueGray,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'The following items have been identified in your cart:'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 5),
                if (state.cartContainsSuspendedMaterials)
                  BulletWidget(
                    padding: const EdgeInsets.only(bottom: 5),
                    content: Text(
                      'Suspended material'.tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                Text(
                  'Please review and remove these items from cart to proceed to check out.'
                      .tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 5),
                _InvalidItemRemoveButton(
                  invalidItems: state.invalidCartItems,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _InvalidItemRemoveButton extends StatelessWidget {
  final List<MaterialInfo> invalidItems;
  const _InvalidItemRemoveButton({
    Key? key,
    required this.invalidItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isClearing != current.isClearing,
      builder: (context, state) {
        return OutlinedButton(
          onPressed: () {
            if (!state.isClearing) {
              context.read<CartBloc>().add(
                    CartEvent.removeInvalidProducts(
                      invalidCartItems: invalidItems,
                    ),
                  );
            }
          },
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: const MaterialStatePropertyAll(
                  ZPColors.paleBlueGray,
                ),
                side: const MaterialStatePropertyAll(
                  BorderSide(
                    color: ZPColors.primary,
                  ),
                ),
              ),
          child: LoadingShimmer.withChild(
            enabled: state.isClearing,
            child: Text(
              'Remove items'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ZPColors.primary),
            ),
          ),
        );
      },
    );
  }
}
