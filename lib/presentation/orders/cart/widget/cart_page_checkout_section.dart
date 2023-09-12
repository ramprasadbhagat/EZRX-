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
                '${"Order for".tr()} ${context.read<CustomerCodeBloc>().state.customerCodeInfo.customerName}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
            const _MWPCheckMessage(),
            _CartPageOOSMessage(),
            const _MovCheckMessage(),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              title: Text(
                '${state.cartProducts.length} items',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: PriceComponent(
                key: WidgetKeys.grandTotalKey,
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
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
      useSafeArea: true,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _CartPageSummaryInfo(),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
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
        );
      },
    );
  }
}

class _CartPageSummaryInfo extends StatelessWidget {
  const _CartPageSummaryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${"Order for".tr()} ${context.read<CustomerCodeBloc>().state.customerCodeInfo.customerName}',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          '${"Customer code:".tr()} ${context.read<CustomerCodeBloc>().state.customerCodeInfo.customerCodeSoldTo}',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          context
              .read<CustomerCodeBloc>()
              .state
              .customerCodeInfo
              .fullCustomerAddress,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          '${"Deliver to:".tr()} ${context.read<CustomerCodeBloc>().state.shipToInfo.shipToCustomerCode}',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          context.read<CustomerCodeBloc>().state.shipToInfo.deliveryAddress,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
      ],
    );
  }
}

class _CartPageUnorderedList extends StatelessWidget {
  const _CartPageUnorderedList(this.texts, {Key? key}) : super(key: key);
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: texts
          .map(
            (e) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CartPageUnorderedListItem(
                  text: e,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class _CartPageUnorderedListItem extends StatelessWidget {
  const _CartPageUnorderedListItem({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '• ',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

class _CartPageOOSMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          (previous.isUpdatingStock != current.isUpdatingStock &&
              !current.isUpdatingStock) ||
          (previous.isUpserting != current.isUpserting && !current.isUpserting),
      builder: (context, state) {
        final isOOSAllowed = state.isOOSOrderPresent
            ? !context
                .read<EligibilityBloc>()
                .state
                .doNotAllowOutOfStockMaterials
            : true;

        return !isOOSAllowed
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  tileColor: ZPColors.lightRedStatusColor,
                  title: _CartPageUnorderedList(
                    [
                      'Please remove at items that are out of stock'.tr(),
                      'Please ensure that the order quantity of each item is within order limit'
                          .tr(),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _CartPageCheckoutButton extends StatelessWidget {
  bool _checkEligibility({
    required CartState state,
    required BuildContext context,
  }) =>
      state.isEligibleForCheckout(
        !context.read<EligibilityBloc>().state.doNotAllowOutOfStockMaterials,
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isUpdatingStock != current.isUpdatingStock ||
          previous.isUpserting != current.isUpserting ||
          previous.isMappingPrice != current.isMappingPrice ||
          previous.isFetchingCartProductDetail !=
              current.isFetchingCartProductDetail,
      builder: (context, state) {
        final isFetching = context.read<MaterialPriceBloc>().state.isFetching;

        return SafeArea(
          child: LoadingShimmer.withChild(
            enabled: state.isUpdatingStock ||
                state.isUpserting ||
                state.isFetchingCartProductDetail ||
                isFetching ||
                state.isMappingPrice,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ElevatedButton(
                key: WidgetKeys.checkoutButton,
                onPressed: !_checkEligibility(state: state, context: context)
                    ? null
                    : () => _onCheckOutPressed(context),
                child: const Text('Check out').tr(),
              ),
            ),
          ),
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
