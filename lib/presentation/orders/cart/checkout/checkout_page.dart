import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/delivery_info.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_bonus_item.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_item.dart';
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
          'Checkout'.tr(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const _SummaryInfo(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32.0,
            ),
          ),
          DeliveryInfo(focusNodes: _focusNodes),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 24.0,
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              indent: 0,
              thickness: 1,
              endIndent: 0,
              height: 1,
              color: ZPColors.extraLightGrey2,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32.0,
            ),
          ),
          const _ManufactureScrollList(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8.0,
            ),
          ),
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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return ListTile(
                onTap: () {
                  _showOrderSumary(context);
                },
                dense: true,
                visualDensity: VisualDensity.compact,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                title: Text(
                  '${state.cartProducts.length} items',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PriceComponent(
                      salesOrgConfig:
                          context.read<SalesOrgBloc>().state.configs,
                      price: state.totalPriceWithTax.toString(),
                      title: 'Grand Total: '.tr(),
                      priceLabelStyle:
                          Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: ZPColors.extraLightGrey4,
                              ),
                      currencyCodeTextStyle:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: ZPColors.primary,
                              ),
                      priceTextStyle:
                          Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: ZPColors.primary,
                              ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: ZPColors.neutralsBlack,
                    ),
                  ],
                ),
              );
            },
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
                            shipToInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .shipToInfo,
                            user: context.read<UserBloc>().state.user,
                            // cartItems: cartItems,
                            cartProducts:
                                context.read<CartBloc>().state.cartProducts,
                            grandTotal:
                                context.read<CartBloc>().state.grandTotal(
                                      isMYMarketSalesRep: false,
                                    ),
                            orderValue: context
                                .read<CartBloc>()
                                .state
                                .totalPriceWithTax,
                            customerCodeInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .customerCodeInfo,
                            salesOrganisation: context
                                .read<SalesOrgBloc>()
                                .state
                                .salesOrganisation,
                            data: context
                                .read<AdditionalDetailsBloc>()
                                .state
                                .deliveryInfoData,
                            orderDocumentType: context
                                .read<OrderDocumentTypeBloc>()
                                .state
                                .selectedOrderType,
                            config: context.read<SalesOrgBloc>().state.configs,
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
                          context
                              .read<CartBloc>()
                              .add(const CartEvent.clearCart());
                          Navigator.pop(context);
                          showTopSnackBar(
                            context: context,
                            message: 'Order submitted'.tr(),
                          );
                        }
                      },
                      (either) => {},
                    );
                  },
                  builder: (context, state) => ElevatedButton(
                    key: WidgetKeys.checkoutButton,
                    onPressed: state.isSubmitting
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
                      child: const Text('Place order').tr(),
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

  void _showOrderSumary(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      useSafeArea: true,
      builder: (_) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                children: [
                  const _OrderSummary(),
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

class _SummaryInfo extends StatelessWidget {
  const _SummaryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        color: ZPColors.primary,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${context.read<CustomerCodeBloc>().state.customerCodeInfo.customerName}',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Customer Code: ${context.read<CustomerCodeBloc>().state.customerCodeInfo.customerCodeSoldTo}'
                  .tr(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.white,
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
                    color: ZPColors.white,
                  ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Deliver to: ${context.read<CustomerCodeBloc>().state.shipToInfo.shipToCustomerCode}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              context.read<CustomerCodeBloc>().state.shipToInfo.deliveryAddress,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ManufactureScrollList extends StatelessWidget {
  const _ManufactureScrollList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index == 0 ||
                          state.cartProducts[index].materialInfo.principalData
                                  .principalName
                                  .getValue() !=
                              state.cartProducts[index - 1].materialInfo
                                  .principalData.principalName
                                  .getValue()
                      ? _TitleScrollList(
                          cartProduct: state.cartProducts[index].materialInfo,
                        )
                      : const SizedBox.shrink(),
                  CheckoutProductItem(cartItem: state.cartProducts[index]),
                  state.cartProducts[index].addedBonusList.isNotEmpty
                      ? CheckoutProductBonusItem(
                          cartItem: state.cartProducts[index],
                        )
                      : const SizedBox.shrink(),
                ],
              );
            },
            childCount: state.cartProducts.length, // 1000 list items
          ),
        );
      },
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
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: ZPColors.neutralsBlack,
            ),
      ),
    );
  }
}

class _OrderSummary extends StatelessWidget {
  const _OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order summary'.tr(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal (excl.tax):'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                Text(
                  'MRY ${state.totalPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${'Tax at'.tr()}${context.read<SalesOrgBloc>().state.configs.vatValue}%',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),
                    Text(
                      'MYR ${state.tax.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),
                  ],
                ),
                // Text(
                //   'Applies to materials with full tax'.tr(),
                //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //         color: ZPColors.neutralsBlack,
                //         fontSize: 10,
                //       ),
                // )
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Stamp duty:'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                Text(
                  'MYR 0'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Small order fee'.tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),

                    ///ToDo: hard code
                    Text(
                      'MYR 0',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grand Total: '.tr(),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'MYR ',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: ZPColors.neutralsBlack,
                                ),
                      ),
                      TextSpan(
                        text: (state.totalPriceWithTax).toStringAsFixed(2),
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.neutralsBlack,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total savings:'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                Text(
                  'MYR 0'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
