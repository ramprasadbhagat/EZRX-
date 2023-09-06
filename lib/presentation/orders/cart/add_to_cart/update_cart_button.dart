import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TenderContractBloc, TenderContractState>(
      buildWhen: (previous, current) =>
          previous.selectedTenderContract != current.selectedTenderContract ||
          previous.isFetching != current.isFetching,
      builder: (context, state) {
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
            SafeArea(
              child: ElevatedButton(
                key: const Key('updateCart'),
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
                    ? _updateCart(
                        context: context,
                        // selectedContract: state.selectedTenderContract,
                      )
                    : null,
                child: const Text('Update Cart').tr(),
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
        !isFetching;
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

    return cartItems.isEmpty || cartItems.length == 1
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

  void _updateCart({
    required BuildContext context,
  }) {
    context.router.pop();
  }
}
