part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageCheckoutSection extends StatelessWidget {
  const _CartPageCheckoutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.cartProducts != current.cartProducts ||
          previous.isUpdatingStock != current.isUpdatingStock ||
          previous.isUpserting != current.isUpserting ||
          previous.isAplProductLoading != current.isAplProductLoading,
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
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
            const _MovCheckMessage(),
            const _StockInvalidIDMarketMessage(),
            const _CartPageInvalidItemsMessage(),
            PriceSummaryTile(cartState: state),
            if (context
                .read<OrderEligibilityBloc>()
                .state
                .displayPriceNotAvailableMessage)
              const PriceNotAvailableMessage(
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              AddressInfoSection.order(),
              const PayerInformation(expanded: true),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: WidgetKeys.cartShipToAddressSheetCloseButton,
                  onPressed: () {
                    context.router.pop();
                  },
                  child: Text(
                    context.tr('Close'),
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
                  child:
                      BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
                    buildWhen: (previous, current) =>
                        previous.isComboNotAllowedIfPresentInCart !=
                        current.isComboNotAllowedIfPresentInCart,
                    builder: (context, orderState) {
                      return ElevatedButton(
                        key: WidgetKeys.checkoutButton,
                        onPressed: state.isCartDetailsFetching ||
                                materialPriceState.isFetching ||
                                state.isNotAvailableToCheckoutForID ||
                                orderState.isCheckoutNotAllowed
                            ? null
                            : () => _onCheckOutPressed(context),
                        child: const Text('Check out').tr(),
                      );
                    },
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
    final cartState = context.read<CartBloc>().state;
    showModalBottomSheet(
      context: context,
      isScrollControlled: cartState.isHavingMoreThanOnePreOrderInCart,
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
        _callApiForId(context, cartState);
        context.router.pushNamed('orders/cart/checkout');
      },
    );
  }

  void _onCheckOutPressed(BuildContext context) {
    final orderEligibilityState = context.read<OrderEligibilityBloc>().state;
    final cartState = context.read<CartBloc>().state;

    if (orderEligibilityState.eligibleForOrderSubmit) {
      FocusScope.of(context).requestFocus(FocusNode());
      trackMixpanelEvent(
        MixpanelEvents.checkoutSuccess,
        props: {
          MixpanelProps.grandTotal: cartState.grandTotalHidePriceMaterial,
          MixpanelProps.totalQty: cartState.totalCartCount,
        },
      );
      final preOrderItemExist = cartState.allMaterial.preOrderItems.isNotEmpty;
      if (preOrderItemExist) {
        _showPreOrderModal(context: context);
      } else {
        _callApiForId(context, cartState);
        context.router.pushNamed('orders/cart/checkout');
      }
    } else {
      trackMixpanelEvent(
        MixpanelEvents.checkoutFailure,
        props: {
          MixpanelProps.grandTotal: cartState.grandTotalHidePriceMaterial,
          MixpanelProps.totalQty: cartState.totalCartCount,
          MixpanelProps.errorMessage:
              orderEligibilityState.orderEligibleTrackingErrorMessage,
        },
      );
    }
    context.read<OrderEligibilityBloc>().add(
          const OrderEligibilityEvent.validateOrderEligibility(),
        );
  }

  void _callApiForId(BuildContext context, CartState cartState) {
    if (cartState.salesOrganisation.salesOrg.isID) {
      context.read<CartBloc>().add(
            const CartEvent.updatePriceForIdMarket(),
          );
    }
  }
}
