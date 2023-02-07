import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartButton extends StatelessWidget {
  final bool isAddToCartAllowed;
  final PriceAggregate cartItem;

  const AddToCartButton({
    Key? key,
    required this.isAddToCartAllowed,
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

    return cartItems.isEmpty
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
    final userCanCreateOrder =
        context.read<UserBloc>().state.userCanCreateOrder;

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
            if (userCanCreateOrder)
              SafeArea(
                child: ElevatedButton(
                  style: isAddToCartAllowed &&
                      isSelectedTenderContractValid(context) &&
                      isValidQuantitySelected(context)
                      ? null
                      : ElevatedButton.styleFrom(
                    backgroundColor: ZPColors.lightGray,
                  ),
                  onPressed: () => isAddToCartAllowed &&
                      isSelectedTenderContractValid(context) &&
                      isValidQuantitySelected(context)
                      ? _addToCart(context, cartItem)
                      : null,
                  child: const Text('Add to Cart').tr(),
                ),
              ),
          ],
        );
      },
    );
  }

  void _addToCart(BuildContext context, PriceAggregate selectedCartItem) {
    final cartState = context.read<CartBloc>().state;
    if (selectedCartItem.materialInfo.materialGroup4.isFOC &&
        cartState.containNonFocMaterial) {
      showSnackBar(
        context: context,
        message:
        'Covid material cannot be combined with commercial material.'.tr(),
      );
    } else if (!selectedCartItem.materialInfo.materialGroup4.isFOC &&
        cartState.containFocMaterial) {
      showSnackBar(
        context: context,
        message:
        'Commercial material cannot be combined with covid material.'.tr(),
      );
    } else {
      final eligibilityState = context.read<EligibilityBloc>().state;
      final selectedTenderContract =
          context.read<TenderContractBloc>().state.selectedTenderContract;

      context.read<CartBloc>().add(
        CartEvent.addMaterialToCart(
          item: cartItem.copyWith(tenderContract: selectedTenderContract),
          customerCodeInfo: eligibilityState.customerCodeInfo,
          salesOrganisation: eligibilityState.salesOrganisation,
          salesOrganisationConfigs: eligibilityState.salesOrgConfigs,
          shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
          doNotallowOutOfStockMaterial:
          eligibilityState.doNotAllowOutOfStockMaterials,
        ),
      );
      context.router.pop();
    }
  }
}
