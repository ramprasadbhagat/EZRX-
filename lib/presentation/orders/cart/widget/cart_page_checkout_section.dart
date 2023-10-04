part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageCheckoutSection extends StatelessWidget {
  const _CartPageCheckoutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.cartProducts != current.cartProducts ||
          previous.isUpdatingStock != current.isUpdatingStock ||
          previous.isUpserting != current.isUpserting,
      builder: (context, state) {
        return Column(
          children: [
            const Divider(
              color: ZPColors.lightGray2,
              indent: 0,
              endIndent: 0,
              height: 15,
            ),
            ListTile(
              onTap: () => _showSumaryInfo(context),
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              title: Text(
                '${"Order for".tr()} ${context.read<EligibilityBloc>().state.customerCodeInfo.customerName}',
                key: WidgetKeys.cartShipToAddress,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
            const _CartPagePriceMessage(),
            const _MovCheckMessage(),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              title: Text(
                '${state.cartProducts.length} ${'items'.tr()}',
                key: WidgetKeys.cartTotalQty,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: PriceComponent(
                key: WidgetKeys.grandTotalKey,
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: state.grandTotal.toString(),
                title: 'Grand total: '.tr(),
                priceLabelStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.extraLightGrey4,
                        ),
              ),
            ),
            _CartPageCheckoutButton(),
          ],
        );
      },
    );
  }

  void _showSumaryInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      builder: (_) => SafeArea(
        key: WidgetKeys.cartShipToAddressSheet,
        child: Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              AddressInfoSection.order(),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: WidgetKeys.cartShipToAddressSheetCloseButton,
                  onPressed: () {
                    context.router.pop();
                  },
                  child: Text(
                    'Close'.tr(),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ZPColors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CartPageCheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, materialPriceState) {
        return BlocBuilder<CartBloc, CartState>(
          buildWhen: (previous, current) =>
              previous.isCartDetailsFetching != current.isCartDetailsFetching,
          builder: (context, state) {
            return SafeArea(
              child: LoadingShimmer.withChild(
                enabled: state.isCartDetailsFetching ||
                    materialPriceState.isFetching,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ElevatedButton(
                    key: WidgetKeys.checkoutButton,
                    onPressed: state.isCartDetailsFetching ||
                            materialPriceState.isFetching
                        ? null
                        : () => _onCheckOutPressed(context),
                    child: const Text('Check out').tr(),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showPreOrderModal({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          context.read<CartBloc>().state.isHavingMoreThanOnePreOrderInCart,
      enableDrag: false,
      isDismissible: false,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) {
        return const PreOrderModal();
      },
    ).then(
      (value) {
        if (value == null) return;
        context.router.pushNamed('orders/cart/checkout');
      },
    );
  }

  void _onCheckOutPressed(BuildContext context) {
    if (context.read<OrderEligibilityBloc>().state.eligibleForOrderSubmit) {
      FocusScope.of(context).requestFocus(FocusNode());
      context.read<CartBloc>().state.allMaterial.preOrderItems.isNotEmpty
          ? _showPreOrderModal(context: context)
          : context.router.pushNamed('orders/cart/checkout');

      return;
    }
    context.read<OrderEligibilityBloc>().add(
          const OrderEligibilityEvent.validateOrderEligibility(),
        );
  }
}
