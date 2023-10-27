part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ComboDetailAddToCartSection extends StatelessWidget {
  const _ComboDetailAddToCartSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComboDealMaterialDetailBloc,
        ComboDealMaterialDetailState>(
      listenWhen: (previous, current) =>
          previous.apiFailureOrSuccessOption !=
          current.apiFailureOrSuccessOption,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.allSelectedItems != current.allSelectedItems ||
          previous.isUpdateCart != current.isUpdateCart ||
          previous.totalQuantityUnit != current.totalQuantityUnit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: ZPColors.lightGray2,
              indent: 0,
              endIndent: 0,
              height: 15,
            ),
            ListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical: -4, horizontal: -2),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              title: Text(
                '${"Order for".tr()} ${context.read<EligibilityBloc>().state.customerCodeInfo.customerName}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
            if (state.displayMinPurchaseQtyMessage)
              InfoLabel(
                key: WidgetKeys.cartPagePriceMessageWidget,
                margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                mainColor: ZPColors.lightRedStatusColor,
                textValue: context.tr(
                  'You must select at least {unit} product.',
                  namedArgs: {
                    'unit': state.currentDeal.minPurchaseQty.toString(),
                  },
                ),
              ),
            ListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical: -4, horizontal: -2),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.currentDeal.scheme.getTotalUnitMessage(
                      context,
                      totalUnit: state.totalQuantityUnit,
                    ),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  PriceComponent(
                    key: WidgetKeys.grandTotalKey,
                    salesOrgConfig:
                        context.read<EligibilityBloc>().state.salesOrgConfigs,
                    price: state.totalPriceDisplay.toString(),
                    title: 'Total: '.tr(),
                    priceLabelStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.extraLightGrey4,
                            ),
                  ),
                ],
              ),
              subtitle: (state.currentDeal.scheme.displayOriginalPrice &&
                      state.isEnableAddToCart)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.tr(
                            '{percent}% Discount',
                            namedArgs: {
                              'percent':
                                  state.currentDeal.materialComboRateDisplay(
                                materialNumber: state.allMaterialsNumber.first,
                                totalQuantityUnit: state.totalQuantityUnit,
                              ),
                            },
                          ),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: ZPColors.discountedTotalTitle,
                                    height: 1.5,
                                  ),
                        ),
                        PriceComponent(
                          key: WidgetKeys.grandTotalKey,
                          salesOrgConfig: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrgConfigs,
                          price: state.originalPriceSelectedItems.toString(),
                          type: PriceStyle.comboOfferPrice,
                          priceLabelStyle:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: ZPColors.darkerGrey,
                                  ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            if (state.displayNextComboDealMessage)
              ComboDetailNextDealInfo(
                totalQty: state.totalQuantityUnit,
                comboDeal: state.currentDeal,
              ),
            _CartPageCheckoutButton(isUpdateCart: state.isUpdateCart),
          ],
        );
      },
    );
  }
}

class _CartPageCheckoutButton extends StatelessWidget {
  const _CartPageCheckoutButton({required this.isUpdateCart, Key? key})
      : super(key: key);
  final bool isUpdateCart;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          (previous.isUpserting != current.isUpserting &&
                  !current.isUpserting ||
              previous.isClearing != current.isClearing &&
                  !current.isClearing) &&
          (context.router.current.path == 'combo_detail' ||
              (context.router.current.path == 'orders/cart' &&
                  previous.cartProducts != current.cartProducts)),
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {
            final comboDealMaterialDetailBloc =
                context.read<ComboDealMaterialDetailBloc>();
            if (context.router.current.path == 'combo_detail') {
              CustomSnackBar(
                messageText: context.tr(
                  isUpdateCart
                      ? '${comboDealMaterialDetailBloc.state.currentDeal.scheme.comboDealTitleAppbar} has been updated to cart'
                      : '${comboDealMaterialDetailBloc.state.currentDeal.scheme.comboDealTitleAppbar} has been added to cart',
                ),
              ).show(context);
            }

            final overrideQuantity = state
                .getCurrentComboItemByComboDealId(
                  comboDealMaterialDetailBloc
                      .state.allSelectedItems.firstPriceComboDeal.id,
                )
                .comboMaterialsCurrentQuantity;

            comboDealMaterialDetailBloc.add(
              ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
                contain: overrideQuantity.isNotEmpty,
              ),
            );
          },
          (_) {},
        );
      },
      buildWhen: (previous, current) =>
          previous.isUpserting != current.isUpserting,
      builder: (context, state) {
        return SafeArea(
          child: LoadingShimmer.withChild(
            enabled: state.isUpserting,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: BlocBuilder<ComboDealMaterialDetailBloc,
                  ComboDealMaterialDetailState>(
                buildWhen: (previous, current) =>
                    previous.isEnableAddToCart != current.isEnableAddToCart,
                builder: (context, state) {
                  return ElevatedButton(
                    key: WidgetKeys.checkoutButton,
                    onPressed: state.isEnableAddToCart
                        ? () {
                            context.read<CartBloc>().add(
                                  CartEvent.upsertCartItemsWithComboOffers(
                                    priceAggregates: context
                                        .read<ComboDealMaterialDetailBloc>()
                                        .state
                                        .allSelectedItems,
                                  ),
                                );
                          }
                        : null,
                    child: Text(
                      isUpdateCart
                          ? context.tr('Update cart')
                          : context.tr('Add to cart'),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
