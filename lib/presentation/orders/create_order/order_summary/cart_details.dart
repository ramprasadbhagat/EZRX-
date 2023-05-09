
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_bundle_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_combo_deal_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_material_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/disclaimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartDetails extends StatelessWidget {
  const CartDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      key: const Key('_cartDetailsKey'),
      listenWhen: (previous, current) =>
      previous.cartItems.isEmpty != current.cartItems.isEmpty,
      listener: (context, state) {
        if (state.cartItems.isEmpty &&
            !context.read<OrderSummaryBloc>().state.isSubmitSuccess) {
          context.router.pop();
        }
      },
      buildWhen: (previous, current) => previous.cartItems != current.cartItems,
      builder: (context, state) {
        final salesOrgConfig = context.read<SalesOrgBloc>().state.configs;
        final taxCode = context.read<SalesOrgBloc>().state.salesOrg.taxCode;

        final readyToSubmitCartItem = state.selectedCartItems
            .where((e) => e.itemType == CartItemType.material)
            .toList()
            .allMaterials;

        final vatInPercentage = context.read<EligibilityBloc>().state;

        return _CartItemsSection(
          salesOrgConfig: salesOrgConfig,
          taxCode: taxCode,
          readyToSubmitCartItem: readyToSubmitCartItem,
          vatInPercentage: vatInPercentage,
          cartState: state,
        );
      },
    );
  }
}

class _CartItemsSection extends StatelessWidget {
  final SalesOrganisationConfigs salesOrgConfig;
  final String taxCode;
  final List<PriceAggregate> readyToSubmitCartItem;
  final EligibilityState vatInPercentage;
  final CartState cartState;
  const _CartItemsSection({
    required this.salesOrgConfig,
    required this.taxCode,
    required this.readyToSubmitCartItem,
    required this.vatInPercentage,
    required this.cartState,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDocumentTypeBloc, OrderDocumentTypeState>(
      buildWhen: (previous, current) =>
      previous.selectedOrderType != current.selectedOrderType,
      builder: (context, state) {
        final isSpecialOrderType = state.isSpecialOrderType;
        final isMYMarketSalesRep = context.select<EligibilityBloc, bool>(
              (bloc) => bloc.state.isMYMarketSalesRep,
        );
        final isTH = context.read<SalesOrgBloc>().state.salesOrg.isTH;

        context.read<OrderEligibilityBloc>().add(
          OrderEligibilityEvent.update(
            cartItems: readyToSubmitCartItem,
            orderType: context
                .read<OrderDocumentTypeBloc>()
                .state
                .selectedOrderType
                .documentType
                .getOrDefaultValue(''),
            grandTotal: cartState.grandTotal(
              isMYMarketSalesRep: isMYMarketSalesRep,
            ),
            subTotal: cartState.subTotal(
              isMYMarketSalesRep: isMYMarketSalesRep,
            ),
          ),
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Disclaimer(),
            BalanceTextRow(
              keyText: 'Subtotal'.tr(),
              valueText: StringUtils.displayPrice(
                salesOrgConfig,
                cartState.subTotal(
                  isMYMarketSalesRep: isMYMarketSalesRep,
                ),
              ),
            ),
            if (vatInPercentage.salesOrgConfigs.shouldDisplayVATInPercentage)
              BalanceTextRow(
                keyText: '$taxCode in %'.tr(),
                valueText: '${salesOrgConfig.vatValue}%',
              ),
            if (salesOrgConfig.shouldShowTax)
              BalanceTextRow(
                keyText: taxCode.tr(),
                valueText: StringUtils.displayPrice(
                  salesOrgConfig,
                  cartState.vatTotalOnOrderType(
                    isMYMarketSalesRep: isMYMarketSalesRep,
                  ),
                ),
              ),
            BalanceTextRow(
              keyText: 'Min. Order Value'.tr(),
              valueText: StringUtils.displayPrice(
                salesOrgConfig,
                isSpecialOrderType && !isTH
                    ? 0.0
                    : double.parse(salesOrgConfig.minOrderAmount),
              ),
            ),
            BalanceTextRow(
              keyText: 'Grand Total'.tr(),
              valueText: StringUtils.displayPrice(
                salesOrgConfig,
                cartState.grandTotal(
                  isMYMarketSalesRep: isMYMarketSalesRep,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...cartState.selectedCartItems.map((item) {
              switch (item.itemType) {
                case CartItemType.material:
                  return CartMaterialItemTile(
                    key: ValueKey(
                      '${item.materials.first.materialInfo.materialNumber.getValue()}${item.materials.first.quantity}',
                    ),
                    cartItem: item,
                    taxCode: taxCode,
                    isOrderSummaryView: true,
                  );

                case CartItemType.bundle:
                  return CartBundleItemTile(
                    cartItem: item,
                    taxCode: taxCode,
                  );

                case CartItemType.comboDeal:
                  return CartComboDealItem(
                    cartItem: item,
                  );
              }
            }),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
