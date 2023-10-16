import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/checkout_bundle_item.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/delivery_info.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_bonus_item.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_item.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_offer_bonus_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final Map<DeliveryInfoLabel, FocusNode> _focusNodes = {
    DeliveryInfoLabel.poReference: FocusNode(),
    DeliveryInfoLabel.contactPerson: FocusNode(),
    DeliveryInfoLabel.referenceNote: FocusNode(),
    DeliveryInfoLabel.deliveryInstruction: FocusNode(),
    DeliveryInfoLabel.mobileNumber: FocusNode(),
    DeliveryInfoLabel.paymentTerm: FocusNode(),
  };

  late CartState cartState;

  @override
  void initState() {
    cartState = context.read<CartBloc>().state;
    super.initState();
  }

  @override
  void dispose() {
    for (final element in _focusNodes.entries) {
      element.value.dispose();
    }
    super.dispose();
  }

  void _scrollToFocusedObject() {
    _focusNodes[DeliveryInfoLabel.paymentTerm]?.requestFocus();
    Scrollable.ensureVisible(
      _focusNodes[DeliveryInfoLabel.paymentTerm]!.context!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.checkoutPage,
      appBar: AppBar(
        title: Text(
          context.tr('Checkout'),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          key: WidgetKeys.closeButton,
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      body: CustomScrollView(
        key: WidgetKeys.checkoutScrollList,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: AddressInfoSection.noAction(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
          DeliveryInfo(focusNodes: _focusNodes),
          const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
          const SliverToBoxAdapter(
            child: Divider(
              indent: 0,
              thickness: 1,
              endIndent: 0,
              height: 1,
              color: ZPColors.extraLightGrey2,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
          const SliverToBoxAdapter(child: _TotalItems()),
          const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
          _ManufactureScrollList(cartState: cartState),
          const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
          const SliverToBoxAdapter(
            child: Divider(
              indent: 0,
              thickness: 1,
              endIndent: 0,
              height: 1,
              color: ZPColors.extraLightGrey2,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: _OrderSummary(cartState: cartState),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            indent: 0,
            thickness: 1,
            endIndent: 0,
            height: 1,
            color: ZPColors.extraLightGrey2,
          ),
          ListTile(
            onTap: () => _showOrderSumary(context, cartState),
            dense: true,
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            title: Text(
              '${cartState.totalItems} ${context.tr('items')}',
              key: WidgetKeys.checkoutStickyTotalQty,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PriceComponent(
                  key: WidgetKeys.checkoutStickyGrandTotal,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartState.grandTotal.toString(),
                  title: context.tr('Grand Total: '),
                  priceLabelStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.extraLightGrey4,
                          ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16,
                  color: ZPColors.neutralsBlack,
                ),
              ],
            ),
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child:
                  BlocListener<AdditionalDetailsBloc, AdditionalDetailsState>(
                listenWhen: (previous, current) =>
                    previous.isValidated != current.isValidated ||
                    previous.focusTo != current.focusTo,
                listener: (context, state) {
                  if (state.isValidated) {
                    context.read<OrderSummaryBloc>().add(
                          OrderSummaryEvent.submitOrder(
                            cartProducts:
                                context.read<CartBloc>().state.cartProducts,
                            grandTotal:
                                context.read<CartBloc>().state.grandTotal,
                            orderValue: context
                                .read<CartBloc>()
                                .state
                                .totalPriceWithTax,
                            totalTax:
                                context.read<CartBloc>().state.taxMaterial,
                            data: context
                                .read<AdditionalDetailsBloc>()
                                .state
                                .deliveryInfoData,
                          ),
                        );
                  } else {
                    if (state.focusTo == DeliveryInfoLabel.paymentTerm) {
                      _scrollToFocusedObject();
                    }
                    _focusNodes[state.focusTo]?.requestFocus();
                  }
                },
                child: BlocConsumer<OrderSummaryBloc, OrderSummaryState>(
                  listenWhen: (previous, current) =>
                      previous.isSubmitting != current.isSubmitting,
                  listener: (context, state) {
                    state.apiFailureOrSuccessOption.fold(
                      () {
                        if (!state.isSubmitting) {
                          context.read<OrderSummaryBloc>().add(
                                OrderSummaryEvent.orderConfirmationDetail(
                                  priceAggregate: context
                                      .read<CartBloc>()
                                      .state
                                      .cartProducts,
                                ),
                              );
                          context.read<PriceOverrideBloc>().add(
                                const PriceOverrideEvent.initialized(),
                              );
                          context.router.pushNamed('orders/order_confirmation');
                        }
                      },
                      (either) => either.fold(
                        (failure) {
                          trackMixpanelEvent(
                            MixpanelEvents.placeOrderFailure,
                            props: {
                              MixpanelProps.errorMessage:
                                  failure.failureMessage,
                            },
                          );
                          ErrorUtils.handleApiFailure(context, failure);
                        },
                        (_) {},
                      ),
                    );
                  },
                  builder: (context, state) => ElevatedButton(
                    key: WidgetKeys.checkoutButton,
                    onPressed: state.isSubmitting ||
                            !context
                                .read<CartBloc>()
                                .state
                                .isEligibleForCheckout(
                                  !context
                                      .read<EligibilityBloc>()
                                      .state
                                      .doNotAllowOutOfStockMaterials,
                                )
                        ? null
                        : () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            context.read<AdditionalDetailsBloc>().add(
                                  AdditionalDetailsEvent.validateForm(
                                    config: context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .configs,
                                  ),
                                );
                          },
                    child: LoadingShimmer.withChild(
                      enabled: state.isSubmitting,
                      child: Text(context.tr('Place order')),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showOrderSumary(BuildContext context, CartState cartState) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      useSafeArea: true,
      builder: (_) {
        return Wrap(
          key: WidgetKeys.orderPriceSummarySheet,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _OrderSummary(cartState: cartState),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      key: WidgetKeys.closeButton,
                      onPressed: () => context.router.pop(),
                      child: Text(
                        context.tr('Close'),
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.white,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ManufactureScrollList extends StatelessWidget {
  final CartState cartState;
  const _ManufactureScrollList({Key? key, required this.cartState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final item = cartState.cartProducts[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              index == 0 ||
                      cartState.cartProducts[index].materialInfo.principalData
                              .principalName
                              .getValue() !=
                          cartState.cartProducts[index - 1].materialInfo
                              .principalData.principalName
                              .getValue()
                  ? _TitleScrollList(
                      cartProduct: item.materialInfo,
                    )
                  : const SizedBox.shrink(),
              item.materialInfo.type.typeBundle
                  ? CheckoutBundleItem(
                      key: WidgetKeys.cartItemBundleTile(
                        item.bundle.bundleCode,
                      ),
                      cartItem: item,
                    )
                  : CheckoutProductItem(
                      key: WidgetKeys.cartItemProductTile(
                        item.materialInfo.materialNumber.displayMatNo,
                      ),
                      cartItem: item,
                    ),
              if (item.addedBonusList.isNotEmpty)
                Column(
                  children: item.addedBonusList
                      .map(
                        (e) => CheckoutOfferBonusItem(
                          bonusItem: e,
                        ),
                      )
                      .toList(),
                ),
              if (item.bonusSampleItems.isNotEmpty)
                Column(
                  children: item.bonusSampleItems
                      .map(
                        (e) => CheckoutProductBonusItem(
                          bonusItem: e,
                        ),
                      )
                      .toList(),
                ),
            ],
          );
        },
        childCount: cartState.cartProducts.length, // 1000 list items
      ),
    );
  }
}

class _TitleScrollList extends StatelessWidget {
  final MaterialInfo cartProduct;
  const _TitleScrollList({Key? key, required this.cartProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        cartProduct.principalData.principalName.getValue(),
        key: WidgetKeys.cartPrincipalLabel,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: ZPColors.neutralsBlack,
            ),
      ),
    );
  }
}

class _OrderSummary extends StatelessWidget {
  final CartState cartState;
  const _OrderSummary({Key? key, required this.cartState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfig =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('Order summary'),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(height: 24.0),
        Row(
          key: WidgetKeys.checkoutSummarySubTotal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr(
                'Subtotal (${salesOrgConfig.displaySubtotalTaxBreakdown ? "excl" : "incl"}.tax):',
              ),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            PriceComponent(
              salesOrgConfig: salesOrgConfig,
              price: cartState.subTotal.toString(),
              type: PriceStyle.summaryPrice,
            ),
          ],
        ),
        if (salesOrgConfig.displaySubtotalTaxBreakdown) ...[
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${context.tr('Tax at ')}${cartState.totalTaxPercent}%',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ZPColors.neutralsBlack,
                        ),
                  ),
                  PriceComponent(
                    salesOrgConfig: salesOrgConfig,
                    price: cartState.taxMaterial.toString(),
                    type: PriceStyle.summaryPrice,
                  ),
                ],
              ),
              Text(
                context.tr('Applies to materials with full tax'),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.neutralsBlack,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 8.0),
        Row(
          key: WidgetKeys.checkoutSummaryStampDuty,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr('Stamp duty:'),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            PriceComponent(
              salesOrgConfig: salesOrgConfig,
              price: 0.toString(),
              type: PriceStyle.summaryPrice,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Column(
          key: WidgetKeys.checkoutSummarySmallOrderFee,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr('Small order fee'),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),

                ///ToDo: hard code
                PriceComponent(
                  salesOrgConfig: salesOrgConfig,
                  price: 0.toString(),
                  type: PriceStyle.summaryPrice,
                ),
              ],
            ),
            // Text(
            //   'Applies to orders less than MYR 2,000,000.00'.tr(),
            //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            //         color: ZPColors.neutralsBlack,
            //         fontSize: 10,
            //       ),
            // ),
          ],
        ),
        const SizedBox(height: 4.0),
        const Divider(
          thickness: 1,
          color: ZPColors.extraLightGrey3,
          indent: 0,
          endIndent: 0,
        ),
        const SizedBox(height: 8.0),
        Row(
          key: WidgetKeys.checkoutSummaryGrandTotal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr('Grand Total: '),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            PriceComponent(
              salesOrgConfig: salesOrgConfig,
              price: cartState.grandTotal.toString(),
              type: PriceStyle.totalPrice,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          key: WidgetKeys.checkoutSummaryTotalSaving,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr('Total savings:'),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            PriceComponent(
              salesOrgConfig: salesOrgConfig,
              price: 0.toString(),
              type: PriceStyle.summaryPrice,
            ),
          ],
        ),
      ],
    );
  }
}

class _TotalItems extends StatelessWidget {
  const _TotalItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        '${context.tr('Your items ')}(${context.read<CartBloc>().state.totalItems})',
        key: WidgetKeys.checkoutItemsTotalQty,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: ZPColors.neutralsBlack),
      ),
    );
  }
}
