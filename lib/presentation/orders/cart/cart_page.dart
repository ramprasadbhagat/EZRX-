import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_list_tile.dart';
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
            },
            (_) {
              context.read<AuthBloc>().add(const AuthEvent.authCheck());
            },
          ),
        );
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final salesOrgConfig = context.read<SalesOrgBloc>().state.configs;
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ScrollList<PriceAggregate>(
                    emptyMessage: 'Cart is Empty',
                    onRefresh: () {
                      context.read<CartBloc>().add(const CartEvent.fetch());
                    },
                    onLoadingMore: () {},
                    isLoading: state.isFetching,
                    itemBuilder: (context, index, item) => CartItemListTile(
                      cartItem: item,
                      taxCode: taxCode,
                    ),
                    items: state.cartItemList,
                  ),
                ),
              ),
              state.cartItemList.isEmpty
                  ? const SizedBox.shrink()
                  : Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          BalanceTextRow(
                            keyText: 'Subtotal'.tr(),
                            valueText:
                                _displayPrice(salesOrgConfig, state.subtotal),
                          ),
                          salesOrgConfig.enableVat
                              ? BalanceTextRow(
                                  keyText: '$taxCode in %'.tr(),
                                  valueText: '${salesOrgConfig.vatValue}%',
                                )
                              : const SizedBox.shrink(),
                          salesOrgConfig.enableVat
                              ? BalanceTextRow(
                                  keyText: taxCode.tr(),
                                  valueText: _displayPrice(
                                    salesOrgConfig,
                                    state.vatTotal,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          BalanceTextRow(
                            keyText: 'Grand Total'.tr(),
                            valueText: _displayPrice(
                              salesOrgConfig,
                              state.grandTotal,
                            ),
                          ),
                          state.cartItemList.isNotEmpty
                              ? ElevatedButton(
                                  onPressed: () {
                                    context.router.pushNamed('order_summary');
                                  },
                                  child: const Text('Order Summary').tr(),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

String _displayPrice(SalesOrganisationConfigs salesOrgConfig, double price) {
  if (salesOrgConfig.currency.isVN) {
    return '${price.toStringAsFixed(2)} ${salesOrgConfig.currency.code}';
  }

  return '${salesOrgConfig.currency.code} ${price.toStringAsFixed(2)}';
}
