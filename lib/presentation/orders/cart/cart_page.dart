import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_view_model.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_bundle_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_material_item_tile.dart';
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
              Expanded(
                child: ScrollList<CartItem>(
                  emptyMessage: 'Cart is Empty',
                  onRefresh: () {
                    context.read<CartBloc>().add(const CartEvent.fetch());
                  },
                  onLoadingMore: () {},
                  isLoading: state.isFetching,
                  itemBuilder: (context, index, item) {
                    switch (item.itemType) {
                      case CartItemType.material:
                        return CartMaterialItemTile(
                          cartItem: item.materials.first,
                          taxCode: taxCode,
                          showCheckBox: true,
                        );
                      case CartItemType.bundle:
                        return CartBundleItemTile(
                          materialItems: item.materials,
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
                                    context.router.pushNamed('order_summary');
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
}

class _SelectAllButton extends StatelessWidget {
  const _SelectAllButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Expanded(
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
                'Select All',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BalanceTextRow(
                keyText: 'Subtotal'.tr(),
                valueText: _displayPrice(salesOrgConfig, state.subtotal),
                valueFlex: 2,
              ),
              salesOrgConfig.enableVat
                  ? BalanceTextRow(
                      keyText: '$taxCode in %'.tr(),
                      valueText: '${salesOrgConfig.vatValue}%',
                      valueFlex: 2,
                    )
                  : const SizedBox.shrink(),
              salesOrgConfig.enableVat
                  ? BalanceTextRow(
                      keyText: taxCode.tr(),
                      valueText: _displayPrice(
                        salesOrgConfig,
                        state.vatTotal,
                      ),
                      valueFlex: 2,
                    )
                  : const SizedBox.shrink(),
              BalanceTextRow(
                keyText: 'Grand Total'.tr(),
                valueText: _displayPrice(
                  salesOrgConfig,
                  state.grandTotal,
                ),
                valueFlex: 2,
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
