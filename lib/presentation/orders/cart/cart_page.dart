import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_bundle_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_combo_deal_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_material_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption ||
          previous.cartItems != current.cartItems,
      listener: (context, state) {
        if (state.cartItems.isEmpty) {
          context.read<AdditionalDetailsBloc>().add(
                AdditionalDetailsEvent.initialized(
                  config: context.read<SalesOrgBloc>().state.configs,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                ),
              );
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final taxCode = context.read<SalesOrgBloc>().state.salesOrg.taxCode;

        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: const Key('cartpage'),
            appBar: AppBar(
              title: Text(
                '${'My Cart'.tr()} (${state.cartItems.length})',
              ),
            ),
            body: Column(
              children: [
                AnnouncementWidget(
                  currentPath: context.router.currentPath,
                ),
                const AccountSuspendedBanner(),
                _CartScrollList(state: state, taxCode: taxCode),
                state.cartItems.isEmpty
                    ? const SizedBox.shrink()
                    : Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 2.0,
                              offset: Offset(0.0, 0.75),
                            ),
                          ],
                          color: ZPColors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                _SelectAllButton(),
                                _TotalSection(),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SafeArea(
                              child: ElevatedButton(
                                key: const ValueKey('orderSummaryButton'),
                                onPressed: state.selectedCartItems.isEmpty
                                    ? null
                                    : () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        trackMixpanelEvent(
                                          MixpanelEvents.goToOrderSummary,
                                        );
                                        _goToOrderSummary(context);
                                      },
                                child: const Text('Order Summary').tr(),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _goToOrderSummary(BuildContext context) {
    final isMYMarketSalesRep =
        context.read<EligibilityBloc>().state.isMYMarketSalesRep;
    final config = context.read<SalesOrgBloc>().state.configs;
    final customerCodeInfo =
        context.read<CustomerCodeBloc>().state.customerCodeInfo;
    final billToInfo = customerCodeInfo.billToInfos.isNotEmpty
        ? customerCodeInfo.billToInfos.first
        : BillToInfo.empty();
    var maxStep = 4;
    var additionDetailsStep = 3;
    if (config.enableBillTo &&
        billToInfo.billToCustomerCode.isNotEmpty &&
        customerCodeInfo.customerCodeSoldTo != billToInfo.billToCustomerCode) {
      maxStep = 5;
      additionDetailsStep = 4;
    }
    context.read<OrderSummaryBloc>().add(OrderSummaryEvent.initialized(
          additionalDetailsStep: additionDetailsStep,
          maxSteps: maxStep,
          step: 0,
          config: config,
        ));

    context.read<OrderEligibilityBloc>().add(
          OrderEligibilityEvent.initialized(
            cartItems:
                context.read<CartBloc>().state.selectedCartItems.allMaterials,
            configs: config,
            customerCodeInfo: customerCodeInfo,
            grandTotal: context.read<CartBloc>().state.grandTotal(
                  isMYMarketSalesRep: isMYMarketSalesRep,
                ),
            orderType: context
                .read<OrderDocumentTypeBloc>()
                .state
                .selectedOrderType
                .documentType
                .getOrDefaultValue(''),
            salesOrg: context.read<SalesOrgBloc>().state.salesOrganisation,
            shipInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
            user: context.read<UserBloc>().state.user,
            subTotal: context.read<CartBloc>().state.subTotal(
                  isMYMarketSalesRep: isMYMarketSalesRep,
                ),
          ),
        );
    context.router.pushNamed('orders/order_summary');
  }
}

class _CartScrollList extends StatelessWidget {
  const _CartScrollList({
    Key? key,
    required this.state,
    required this.taxCode,
  }) : super(key: key);

  final CartState state;
  final String taxCode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollList<CartItem>(
        emptyMessage: 'Cart is Empty'.tr(),
        controller: ScrollController(),
        onRefresh: () {
          context.read<CartBloc>().add(
                CartEvent.fetch(
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  salesOrganisationConfigs:
                      context.read<SalesOrgBloc>().state.configs,
                  shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
                  doNotAllowOutOfStockMaterials: context
                      .read<EligibilityBloc>()
                      .state
                      .doNotAllowOutOfStockMaterials,
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  comboDealEligible:
                      context.read<EligibilityBloc>().state.comboDealEligible,
                  isSpecialOrderType: context
                      .read<OrderDocumentTypeBloc>()
                      .state
                      .isSpecialOrderType,
                ),
              );
        },
        isLoading: state.isFetching && state.cartItems.isEmpty,
        itemBuilder: (context, index, item) {
          switch (item.itemType) {
            case CartItemType.material:
              return CartMaterialItemTile(
                cartItem: item,
                key: ValueKey(
                  '${item.materials.first.materialInfo.materialNumber.getValue()}${item.materials.first.quantity}',
                ),
                taxCode: taxCode,
                showCheckBox: true,
              );
            case CartItemType.bundle:
              return CartBundleItemTile(
                cartItem: item,
                taxCode: taxCode,
                showCheckBox: true,
              );
            case CartItemType.comboDeal:
              return CartComboDealItem(
                cartItem: item,
                showCheckBox: true,
              );
          }
        },
        items: state.cartItems,
      ),
    );
  }
}

class _SelectAllButton extends StatelessWidget {
  const _SelectAllButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Expanded(
          key: const Key('selectAllButton'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                key: const Key('selectAllRadioButton'),
                value: state.selectedCartItems.length,
                groupValue: state.cartItems.length,
                toggleable: true,
                onChanged: (value) {
                  context.read<CartBloc>().add(
                        const CartEvent.selectAllButtonTapped(),
                      );
                },
              ),
              Flexible(
                child: Text(
                  'Select All'.tr(),
                  style: TextStyle(
                    color:
                        state.selectedCartItems.length == state.cartItems.length
                            ? ZPColors.primary
                            : ZPColors.black,
                    overflow: TextOverflow.ellipsis,
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

class _TotalSection extends StatelessWidget {
  const _TotalSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vatInPercentage = context.read<EligibilityBloc>().state;

    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final salesOrgConfig = context.read<SalesOrgBloc>().state.configs;
        final taxCode = context.read<SalesOrgBloc>().state.salesOrg.taxCode;

        return _TotalPriceSection(
          salesOrgConfig: salesOrgConfig,
          cartState: state,
          vatInPercentage: vatInPercentage,
          taxCode: taxCode,
        );
      },
    );
  }
}

class _TotalPriceSection extends StatelessWidget {
  final SalesOrganisationConfigs salesOrgConfig;
  final CartState cartState;
  final EligibilityState vatInPercentage;
  final String taxCode;
  const _TotalPriceSection({
    required this.salesOrgConfig,
    required this.cartState,
    required this.vatInPercentage,
    required this.taxCode,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDocumentTypeBloc, OrderDocumentTypeState>(
      buildWhen: (previous, current) =>
          previous.selectedOrderType != current.selectedOrderType,
      builder: (context, state) {
        final isMYMarketSalesRep = context.select<EligibilityBloc, bool>(
          (bloc) => bloc.state.isMYMarketSalesRep,
        );

        return Expanded(
          flex: 2,
          key: const Key('totalSection'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BalanceTextRow(
                keyText: 'Subtotal'.tr(),
                valueText: StringUtils.displayPrice(
                  salesOrgConfig,
                  cartState.subTotal(
                    isMYMarketSalesRep: isMYMarketSalesRep,
                  ),
                ),
                valueFlex: 1,
              ),
              if (vatInPercentage.salesOrgConfigs.shouldDisplayVATInPercentage)
                BalanceTextRow(
                  key: const Key('taxCodeInPercentageKey'),
                  keyText: '$taxCode in %'.tr(),
                  valueText: '${salesOrgConfig.vatValue}%',
                  valueFlex: 1,
                ),
              if (salesOrgConfig.shouldShowTax)
                BalanceTextRow(
                  key: const Key('totalTaxKey'),
                  keyText: taxCode.tr(),
                  valueText: StringUtils.displayPrice(
                    salesOrgConfig,
                    cartState.vatTotalOnOrderType(
                      isMYMarketSalesRep: isMYMarketSalesRep,
                    ),
                  ),
                  valueFlex: 1,
                ),
              BalanceTextRow(
                key: const Key('grandTotalKey'),
                keyText: 'Grand Total'.tr(),
                valueText: StringUtils.displayPrice(
                  salesOrgConfig,
                  cartState.grandTotal(
                    isMYMarketSalesRep: isMYMarketSalesRep,
                  ),
                ),
                valueFlex: 1,
              ),
            ],
          ),
        );
      },
    );
  }
}
