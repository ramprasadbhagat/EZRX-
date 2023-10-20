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
          previous.items != current.items ||
          previous.isUpdateCart != current.isUpdateCart,
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
              dense: true,
              visualDensity: VisualDensity.compact,
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
            ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              title: Text(
                '${state.allSelectedItems.length} ${'items'.tr()}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: PriceComponent(
                key: WidgetKeys.grandTotalKey,
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: state.totalPriceSelectedItems.toString(),
                title: 'Total: '.tr(),
                priceLabelStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.extraLightGrey4,
                        ),
              ),
            ),
            _CartPageCheckoutButton(
              isUpdateCart: state.isUpdateCart,
            ),
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
            if (context.router.current.path == 'combo_detail') {
              CustomSnackBar(
                messageText: context.tr(
                  isUpdateCart
                      ? 'Combo K1 has been updated to cart'
                      : 'Combo K1 has been added to cart',
                ),
              ).show(context);
            }
            final comboDealMaterialDetailBloc =
                context.read<ComboDealMaterialDetailBloc>();
            final overrideQuantity = state
                .getCurrentComboItemByMaterialNumbers(
                  comboDealMaterialDetailBloc.state.allMaterialsNumber
                      .map((e) => e.getValue())
                      .toList(),
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
              child: ElevatedButton(
                key: WidgetKeys.checkoutButton,
                onPressed: () {
                  context.read<CartBloc>().add(
                        CartEvent.upsertCartItemsWithComboOffers(
                          priceAggregates: context
                              .read<ComboDealMaterialDetailBloc>()
                              .state
                              .allSelectedItems,
                        ),
                      );
                },
                child: Text(
                  isUpdateCart
                      ? context.tr('Update cart')
                      : context.tr('Add to cart'),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
