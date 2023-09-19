import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart_error_section_for_covid.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

class AddToCartButton extends StatelessWidget {
  final bool isAddToCartAllowed;
  final PriceAggregate cartItem;

  const AddToCartButton({
    Key? key,
    required this.isAddToCartAllowed,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TenderContractBloc, TenderContractState>(
      buildWhen: (previous, current) =>
          previous.selectedTenderContract != current.selectedTenderContract,
      builder: (builderContext, state) {
        return Column(
          children: [
            if (!_isSelectedTenderContractValid(
              context: context,
              selectedContract: state.selectedTenderContract,
            ))
              const Text(
                'Tender material 730 cannot be combined with any other material in the cart.',
                key: Key('addTOCartTenderOrderInvalidCombinationError'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ZPColors.red,
                ),
              ),
            if (context.read<UserBloc>().state.user.userCanCreateOrder)
              SafeArea(
                child: ElevatedButton(
                  key: const Key('addMaterialToCart'),
                  style: _buttonEnabled(
                    context: context,
                    isFetching: state.isFetching,
                    selectedContract: state.selectedTenderContract,
                  )
                      ? null
                      : ElevatedButton.styleFrom(
                          backgroundColor: ZPColors.lightGray,
                        ),
                  onPressed: () => _buttonEnabled(
                    context: context,
                    isFetching: state.isFetching,
                    selectedContract: state.selectedTenderContract,
                  )
                      ? _addToCart(context, cartItem)
                      : null,
                  child: const Text('Add to cart').tr(),
                ),
              ),
          ],
        );
      },
    );
  }

  bool _buttonEnabled({
    required BuildContext context,
    required TenderContract selectedContract,
    required bool isFetching,
  }) {
    return _isSelectedTenderContractValid(
          context: context,
          selectedContract: selectedContract,
        ) &&
        _isValidQuantitySelected(
          selectedContract: selectedContract,
        ) &&
        !isFetching &&
        isAddToCartAllowed;
  }

  bool _isSelectedTenderContractValid({
    required BuildContext context,
    required TenderContract selectedContract,
  }) {
    final cartItems = context.read<CartBloc>().state.cartProducts;
    final tenderContractInCart = cartItems.isEmpty
        ? TenderContract.empty()
        : cartItems
            .firstWhere(
              (element) => element.tenderContract.tenderOrderReason.is730,
              orElse: () => cartItems.first,
            )
            .tenderContract;
    final selectedTenderContractReason = selectedContract.tenderOrderReason;
    final tenderContractInCartReason = tenderContractInCart.tenderOrderReason;

    return cartItems.isEmpty
        ? true
        : tenderContractInCartReason.is730 ==
            selectedTenderContractReason.is730;
  }

  bool _isValidQuantitySelected({
    required TenderContract selectedContract,
  }) {
    return selectedContract == TenderContract.empty() ||
        selectedContract == TenderContract.noContract() ||
        cartItem.quantity <= selectedContract.remainingTenderQuantity;
  }

  void _addToCart(BuildContext context, PriceAggregate selectedCartItem) {
    final cartState = context.read<CartBloc>().state;
    final isFocMaterialInCart = cartState.containFocMaterialInCartProduct;
    final isFocMaterial = selectedCartItem.materialInfo.isFOCMaterial;

    if ((isFocMaterial && !isFocMaterialInCart) ||
        (!isFocMaterial && isFocMaterialInCart)) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (_) {
          return const AddToCartErrorSection();
        },
      );
    } else if (selectedCartItem.isSpecialOrderType &&
        selectedCartItem.materialInfo.isFOCMaterial &&
        cartState.containSampleMaterial &&
        cartState.containNonFocMaterial) {
      CustomSnackBar(
        messageText:
            'You cannot add non-sample materials to a sample order. Please submit separate orders if you wish to proceed.'
                .tr(),
      ).show(context);
    } else if (selectedCartItem.isSpecialOrderType &&
        selectedCartItem.materialInfo.isSampleMaterial &&
        cartState.containFocMaterial &&
        cartState.containNonSampleMaterial) {
      CustomSnackBar(
        messageText:
            'You cannot add non-FOC materials to a FOC order. Please submit separate orders if you wish to proceed'
                .tr(),
      ).show(context);
    } else {
      context.router.pop();
    }
  }
}
