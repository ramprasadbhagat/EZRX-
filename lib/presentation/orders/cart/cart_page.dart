import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_view_model.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_bundle_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_material_item_tile.dart';
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
          current.apiFailureOrSuccessOption,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              final failureMessage = failure.failureMessage;
              showSnackBar(
                context: context,
                message: failureMessage.tr(),
              );
              if (failureMessage == 'authentication failed') {
                context.read<AuthBloc>().add(const AuthEvent.logout());
              }
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final taxCode = context.read<SalesOrgBloc>().state.salesOrg.taxCode;

        return Scaffold(
          key: const Key('cartpage'),
          appBar: AppBar(
            title: Text(
              '${'My Cart'.tr()} (${state.cartItemList.length})',
            ),
          ),
          body: Column(
            children: [
              const AccountSuspendedBanner(),
              Expanded(
                child: ScrollList<CartItem>(
                  emptyMessage: 'Cart is Empty',
                  onRefresh: () {
                    context.read<CartBloc>().add(CartEvent.fetch(
                          customerCodeInfo: context
                              .read<CustomerCodeBloc>()
                              .state
                              .customerCodeInfo,
                          salesOrganisationConfigs:
                              context.read<SalesOrgBloc>().state.configs,
                          shipToInfo:
                              context.read<ShipToCodeBloc>().state.shipToInfo,
                          doNotAllowOutOfStockMaterials: context
                              .read<EligibilityBloc>()
                              .state
                              .doNotAllowOutOfStockMaterials,
                          salesOrganisation: context
                              .read<SalesOrgBloc>()
                              .state
                              .salesOrganisation,
                        ));
                  },
                  isLoading: state.isFetching,
                  itemBuilder: (context, index, item) {
                    switch (item.itemType) {
                      case CartItemType.material:
                        return CartMaterialItemTile(
                          key: ValueKey(
                            '${item.materials.first.materialInfo.materialNumber.getValue()}${item.materials.first.quantity}',
                          ),
                          cartItem: item.materials.first,
                          taxCode: taxCode,
                          showCheckBox: true,
                        );
                      case CartItemType.bundle:
                        return CartBundleItemTile(
                          cartItem: item,
                          taxCode: taxCode,
                          showCheckBox: true,
                        );
                    }
                  },
                  items: state.displayCartItems,
                ),
              ),
              state.cartItemList.isEmpty
                  ? const SizedBox.shrink()
                  : Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15.0,
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
                          ElevatedButton(
                            onPressed: state.selectedItemList.isEmpty
                                ? null
                                : () {
                                    _goToOrderSummary(context);
                                  },
                            child: const Text('Order Summary').tr(),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  void _goToOrderSummary(BuildContext context) {
    final config = context.read<SalesOrgBloc>().state.configs;
    final customerCodeInfo =
        context.read<CustomerCodeBloc>().state.customerCodeInfo;
    final billToInfo = customerCodeInfo.billToInfos.isNotEmpty
        ? customerCodeInfo.billToInfos.first
        : BillToInfo.empty();
    var maxStep = 5;
    var additionDetailsStep = 3;
    if (config.enableBillTo &&
        billToInfo.billToCustomerCode.isNotEmpty &&
        customerCodeInfo.customerCodeSoldTo != billToInfo.billToCustomerCode) {
      maxStep = 6;
      additionDetailsStep = 4;
    }
    context.read<OrderSummaryBloc>().add(OrderSummaryEvent.initialized(
          additionalDetailsStep: additionDetailsStep,
          maxSteps: maxStep,
          step: 0,
        ));
    final selectedMaterialList =
        context.read<CartBloc>().state.selectedItemsMaterialNumber;
    context
        .read<OrderEligibilityBloc>()
        .add(OrderEligibilityEvent.checkMinimumOrderValue(
          cartItems: context
              .read<CartBloc>()
              .state
              .cartItemList
              .where((element) =>
                  selectedMaterialList.contains(element.getMaterialNumber))
              .toList(),
          configs: config,
          customerCodeInfo: customerCodeInfo,
          grandTotal: context.read<CartBloc>().state.grandTotal,
          orderType: '',
          salesOrg: context.read<SalesOrgBloc>().state.salesOrganisation,
          shipInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
          user: context.read<UserBloc>().state.user,
        ));
    context.router.pushNamed('order_summary');
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
          flex: 1,
          key: const Key('selectAllButton'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                value: state.selectedItemList.length,
                groupValue: state.cartItemList.length,
                toggleable: true,
                onChanged: (value) {
                  context.read<CartBloc>().add(
                        const CartEvent.updateSelectAllItems(),
                      );
                },
              ),
              Text(
                'Select All'.tr(),
                style: TextStyle(
                  color: state.selectedItemsMaterialNumber.length ==
                          state.cartItemList.length
                      ? ZPColors.primary
                      : ZPColors.black,
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
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final salesOrgConfig = context.read<SalesOrgBloc>().state.configs;
        final taxCode = context.read<SalesOrgBloc>().state.salesOrg.taxCode;

        return Expanded(
          flex: 2,
          key: const Key('totalSection'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BalanceTextRow(
                keyText: 'Subtotal'.tr(),
                valueText:
                    StringUtils.displayPrice(salesOrgConfig, state.subtotal),
                valueFlex: 1,
              ),
              salesOrgConfig.enableVat ||
                      salesOrgConfig.enableTaxAtTotalLevelOnly
                  ? BalanceTextRow(
                      keyText: '$taxCode in %'.tr(),
                      valueText: '${salesOrgConfig.vatValue}%',
                      valueFlex: 1,
                    )
                  : const SizedBox.shrink(),
              salesOrgConfig.enableVat ||
                      salesOrgConfig.enableTaxAtTotalLevelOnly
                  ? BalanceTextRow(
                      keyText: taxCode.tr(),
                      valueText: StringUtils.displayPrice(
                        salesOrgConfig,
                        state.vatTotal,
                      ),
                      valueFlex: 1,
                    )
                  : const SizedBox.shrink(),
              BalanceTextRow(
                keyText: 'Grand Total'.tr(),
                valueText: StringUtils.displayPrice(
                  salesOrgConfig,
                  state.grandTotal,
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
