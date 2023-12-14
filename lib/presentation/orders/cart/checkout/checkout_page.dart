import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/domain/utils/date_time_utils.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/po_upload_attachment_section.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_bundle_item/checkout_bundle_item.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_material_item/checkout_material_item.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo.dart';
import 'package:ezrxmobile/presentation/orders/cart/price_summary/price_summary_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

part 'widgets/delivery_info.dart';
part 'widgets/request_delivery_date.dart';
part 'widgets/product_bonus_item.dart';
part 'widgets/product_scroll_list.dart';
part 'widgets/total_items.dart';

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

  @override
  void initState() {
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
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.isFetchingBonus != current.isFetchingBonus &&
          !current.isFetchingBonus,
      listener: (context, state) {
        if (state.cartProducts.any((e) => !e.inStock)) {
          context.router.pop();
        } else {
          context.read<CartBloc>().add(
                CartEvent.updatePriceForIdMarket(locale: context.locale),
              );
        }
      },
      buildWhen: (previous, current) =>
          previous.isCartDetailsFetching != current.isCartDetailsFetching,
      builder: (context, cartState) {
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
              _DeliveryInfo(focusNodes: _focusNodes),
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
              _ProductScrollList(cartState: cartState),
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
                  child: PriceSummarySection(cartState: cartState),
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
              PriceSummaryTile(cartState: cartState),
              SafeArea(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: BlocListener<AdditionalDetailsBloc,
                      AdditionalDetailsState>(
                    listenWhen: (previous, current) =>
                        previous.isValidated != current.isValidated ||
                        previous.focusTo != current.focusTo,
                    listener: (context, state) {
                      if (state.isValidated) {
                        context.read<OrderSummaryBloc>().add(
                              OrderSummaryEvent.submitOrder(
                                cartProducts:
                                    context.read<CartBloc>().state.cartProducts,
                                grandTotal: context
                                    .read<CartBloc>()
                                    .state
                                    .grandTotalSubmit,
                                orderValue: context
                                    .read<CartBloc>()
                                    .state
                                    .subTotalSubmit,
                                smallOrderFee: context
                                    .read<CartBloc>()
                                    .state
                                    .aplSimulatorOrder
                                    .smallOrderFee,
                                totalTax:
                                    context.read<CartBloc>().state.totalTax,
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
                              context.read<PoAttachmentBloc>().add(
                                    const PoAttachmentEvent.initialized(),
                                  );
                              context.router
                                  .pushNamed('orders/order_confirmation');
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
                      builder: (context, state) {
                        return ElevatedButton(
                          key: WidgetKeys.checkoutButton,
                          onPressed: state.isSubmitting ||
                                  cartState.isCartDetailsFetching ||
                                  !context
                                      .read<CartBloc>()
                                      .state
                                      .isEligibleForCheckout(
                                        !eligibilityState
                                            .doNotAllowOutOfStockMaterials,
                                      )
                              ? null
                              : () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
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
                            enabled: state.isSubmitting ||
                                cartState.isCartDetailsFetching,
                            child: Text(context.tr('Place order')),
                          ),
                        );
                      },
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
