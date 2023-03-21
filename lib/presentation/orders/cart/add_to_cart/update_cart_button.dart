import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCartButton extends StatelessWidget {
  final PriceAggregate cartItem;

  const UpdateCartButton({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  bool isSelectedTenderContractValid(BuildContext context) {
    final cartItems = context.read<CartBloc>().state.cartItems.allMaterials;
    final tenderContractInCart = cartItems.isEmpty
        ? TenderContract.empty()
        : cartItems
            .firstWhere(
              (element) => element.tenderContract.tenderOrderReason.is730,
              orElse: () => cartItems.first,
            )
            .tenderContract;
    final selectedTenderContractReason = context
        .read<TenderContractBloc>()
        .state
        .selectedTenderContract
        .tenderOrderReason;
    final tenderContractInCartReason = tenderContractInCart.tenderOrderReason;

    return cartItems.isEmpty || cartItems.length == 1
        ? true
        : ((tenderContractInCartReason.is730 ==
                selectedTenderContractReason.is730) ||
            (!tenderContractInCartReason.is730 ==
                !selectedTenderContractReason.is730));
  }

  bool isValidQuantitySelected(BuildContext context) {
    final selectedQuantity = cartItem.quantity;
    final selectedTenderContract =
        context.read<TenderContractBloc>().state.selectedTenderContract;

    return selectedTenderContract == TenderContract.empty() ||
        selectedTenderContract == TenderContract.noContract() ||
        selectedQuantity <= selectedTenderContract.remainingTenderQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TenderContractBloc, TenderContractState>(
      buildWhen: (previous, current) =>
          previous.selectedTenderContract != current.selectedTenderContract,
      builder: (builderContext, state) {
        return Column(
          children: [
            isSelectedTenderContractValid(context)
                ? const SizedBox.shrink()
                : const Text(
                    'Tender material 730 cannot be combined with any other material in the cart.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ZPColors.red,
                    ),
                  ),
            SafeArea(
              child: ElevatedButton(
                key: const Key('updateCart'),
                style: isSelectedTenderContractValid(context) &&
                        isValidQuantitySelected(context)
                    ? null
                    : ElevatedButton.styleFrom(
                        backgroundColor: ZPColors.lightGray,
                      ),
                onPressed: () => isSelectedTenderContractValid(context) &&
                        isValidQuantitySelected(context)
                    ? _updateCart(context, cartItem)
                    : null,
                child: const Text('Update Cart').tr(),
              ),
            ),
          ],
        );
      },
    );
  }

  void _updateCart(BuildContext context, PriceAggregate selectedCartItem) {
    final selectedTenderContract =
        context.read<TenderContractBloc>().state.selectedTenderContract;

    context.read<CartBloc>().add(
          CartEvent.addMaterialToCart(
            item: cartItem.copyWith(tenderContract: selectedTenderContract),
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            overrideQty: true,
            doNotallowOutOfStockMaterial: context
                .read<EligibilityBloc>()
                .state
                .doNotAllowOutOfStockMaterials,
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            salesOrganisationConfigs:
                context.read<SalesOrgBloc>().state.configs,
            shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
              isSpecialOrderType: context
                  .read<OrderDocumentTypeBloc>()
                  .state
                  .isSpecialOrderType,
          ),
        );
    context.router.pop();
  }
}
