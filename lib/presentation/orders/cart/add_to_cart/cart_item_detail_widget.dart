import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_bonus_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/price_tier_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/snackbar.dart';


class CartItemDetailWidget extends StatefulWidget {
  const CartItemDetailWidget({
    Key? key,
    required this.cartItem,
    required this.onQuantityChanged,
  }) : super(key: key);

  final PriceAggregate cartItem;
  final Function(int) onQuantityChanged;

  @override
  State<CartItemDetailWidget> createState() => _CartItemDetailWidgetState();
}

class _CartItemDetailWidgetState extends State<CartItemDetailWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: _qty);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CartItemDetailWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_qty != _controller.text) {
      _controller.text = _qty;
      _controller.selection = TextSelection.collapsed(offset: _qty.length);
    }
  }

  void _validateZdp5Quantity(BuildContext context, int value) {
    if (!widget.cartItem.isZdp5DiscountEligible) return;

    final isZdp5Eligible = widget.cartItem.hasZdp5Validation(value);

    if (isZdp5Eligible) {
      showSnackBar(
        context: context,
        message:
            'You have exceeded the remaining quantity limit: ${widget.cartItem.price.zdp5RemainingQuota.getOrDefaultValue('')}'
                .tr(),
      );
    }
  }

  String get _qty => widget.cartItem.quantity.toString();

  @override
  Widget build(BuildContext context) {
    final taxCode = context.read<SalesOrgBloc>().state.salesOrg.taxCode;
    final enableVat = context.read<SalesOrgBloc>().state.configs.enableVat;

    return Column(
      children: [
        Text(
          widget.cartItem.materialInfo.materialDescription,
          style: Theme.of(context).textTheme.titleLarge?.apply(
                color: ZPColors.black,
              ),
        ),
        Text(
          widget.cartItem.materialInfo.principalData.principalName
              .getOrDefaultValue(''),
          style: Theme.of(context).textTheme.titleMedium?.apply(
                color: ZPColors.lightGray,
              ),
        ),
        Text(
          widget.cartItem.materialInfo.materialNumber.displayMatNo.tr(),
          style: Theme.of(context).textTheme.titleMedium?.apply(
                color: ZPColors.darkGray,
              ),
        ),
        BonusDetails(
          cartItem: widget.cartItem,
        ),
        if (widget.cartItem.price.isDiscountEligible)
          Column(
            key: const Key('tieredPricing'),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'Tiered Pricing'.tr()} :',
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              ...widget.cartItem.price.tiers.first.items
                  .map((e) => PriceTierLabel(priceTierItem: e))
                  .toList(),
            ],
          ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: QuantityInput(
            isEnabled: true,
            quantityAddKey: const Key('cartItemAdd'),
            quantityDeleteKey: const Key('cartItemDelete'),
            quantityTextKey: const Key('item'),
            controller: _controller,
            onFieldChange: (val) {
              widget.onQuantityChanged.call(val);
              _validateZdp5Quantity(context, val);
            },
            minusPressed: (val) {
              widget.onQuantityChanged.call(val);
              _validateZdp5Quantity(context, int.parse(_controller.text));
            },
            addPressed: (val) {
              widget.onQuantityChanged.call(val);
              _validateZdp5Quantity(context, int.parse(_controller.text));
            },
          ),
        ),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: _controller,
          builder: (context, controller, _) {
            return BlocBuilder<TenderContractBloc, TenderContractState>(
              builder: (context, state) {
                final value = int.tryParse(controller.text);

                //If controller.text is blank (User clears the text field), then int.tryParse would return null.
                //The null check below will cover this scenario
                if (value == null) return const SizedBox.shrink();

                return state.selectedTenderContract ==
                            TenderContract.empty() ||
                        state.selectedTenderContract ==
                            TenderContract.noContract() ||
                        value <=
                            state.selectedTenderContract
                                .remainingTenderQuantity
                    ? const SizedBox.shrink()
                    : const Text(
                        'Please ensure the order quantity is less than \nor equal to Remaining Quantity of the contract',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          color: ZPColors.red,
                        ),
                        key: Key('tenderOrderValidQuantityErrorText'),
                      );
              },
            );
          },
        ),
        BlocBuilder<TenderContractBloc, TenderContractState>(
          buildWhen: (previous, current) =>
              previous.selectedTenderContract !=
              current.selectedTenderContract,
          builder: (context, state) {
            final cartItem =
                state.selectedTenderContract == TenderContract.empty() ||
                        state.selectedTenderContract ==
                            TenderContract.noContract()
                    ? widget.cartItem
                    : widget.cartItem.copyWith(
                        tenderContract: state.selectedTenderContract,
                        price: widget.cartItem.price.copyWith(
                          finalPrice: MaterialPrice(
                            state.selectedTenderContract.tenderPrice
                                .tenderPriceByPricingUnit(
                              state.selectedTenderContract.pricingUnit,
                            ),
                          ),
                        ),
                      );

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  enableVat
                      ? BalanceTextRow(
                          keyText: 'Unit price before $taxCode'.tr(),
                          valueText:
                              cartItem.display(PriceType.finalPrice).tr(),
                          keyFlex: 1,
                          valueFlex: 1,
                        )
                      : const SizedBox.shrink(),
                  BalanceTextRow(
                    keyText: 'Unit Price'.tr(),
                    valueText: cartItem.display(PriceType.unitPrice).tr(),
                    keyFlex: 1,
                    valueFlex: 1,
                  ),
                  enableVat
                      ? BalanceTextRow(
                          keyText: 'Total price before $taxCode'.tr(),
                          valueText: cartItem
                              .display(PriceType.finalPriceTotal)
                              .tr(),
                          keyFlex: 1,
                          valueFlex: 1,
                        )
                      : const SizedBox.shrink(),
                  BalanceTextRow(
                    keyText: 'Total Price'.tr(),
                    valueText:
                        cartItem.display(PriceType.unitPriceTotal).tr(),
                    keyFlex: 1,
                    valueFlex: 1,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
