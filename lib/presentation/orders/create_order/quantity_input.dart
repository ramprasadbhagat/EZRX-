import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_icon.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuantityInput extends StatelessWidget {
  final TextEditingController controller;
  final Key quantityTextKey;
  final Function(int) onFieldChange;
  final Function(int)? minusPressed;
  final Function(int)? addPressed;
  final Key quantityAddKey;
  final Key quantityDeleteKey;
  final bool isEnabled;
  final bool isLoading;

  const QuantityInput({
    Key? key,
    required this.controller,
    required this.quantityTextKey,
    required this.onFieldChange,
    this.minusPressed,
    this.addPressed,
    required this.quantityAddKey,
    required this.quantityDeleteKey,
    required this.isEnabled,
    this.isLoading = false,
  }) : super(key: key);

  static const minimumQty = 0;
  static const maximumQty = 100000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 70,
          child: TextField(
            enabled: isEnabled,
            key: quantityTextKey,
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: <TextInputFormatter>[
              // Only digits
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              // Prevent leading zero
              FilteringTextInputFormatter.deny(RegExp(r'^0+')),
              // limit charcter length to 6
              LengthLimitingTextInputFormatter(6),
            ],
            onChanged: (String text) {
              if (text.isEmpty) return;
              onFieldChange(int.parse(text));
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: isEnabled ? const UnderlineInputBorder() : InputBorder.none,
            ),
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        isLoading
            ? const QuantityIconShimmer()
            : isEnabled
                ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QuantityIcon(
                        key: quantityDeleteKey,
                        pressed: () {
                          FocusScope.of(context).unfocus();
                          final value =
                              (int.tryParse(controller.text) ?? 0) - 1;
                          if (value > minimumQty) {
                            final text = value.toString();
                            controller.value = TextEditingValue(
                              text: text,
                              selection: TextSelection.collapsed(
                                offset: controller.selection.base.offset,
                              ),
                            );
                            minusPressed?.call(value);
                          }
                        },
                        icon: Icons.remove,
                        isEnabled: isEnabled && minusPressed != null,
                      ),
                      QuantityIcon(
                        key: quantityAddKey,
                        pressed: () {
                          FocusScope.of(context).unfocus();
                          final value =
                              (int.tryParse(controller.text) ?? 0) + 1;

                          if (value < maximumQty) {
                            final text = value.toString();
                            controller.value = TextEditingValue(
                              text: text,
                              selection: TextSelection.collapsed(
                                offset: controller.selection.base.offset,
                              ),
                            );
                            addPressed?.call(value);
                          }
                        },
                        icon: Icons.add,
                        isEnabled: isEnabled && addPressed != null,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
        if (isEnabled)
          BlocBuilder<TenderContractBloc, TenderContractState>(
            builder: (context, state) {
              final value = int.tryParse(controller.text);

              return state.selectedTenderContract == TenderContract.empty() ||
                      state.selectedTenderContract ==
                          TenderContract.noContract() ||
                      value! <=
                          state.selectedTenderContract.remainingTenderQuantity
                  ? const SizedBox.shrink()
                  : const Text(
                      'Please ensure the order quantity is less than \nor equal to Remaining Quantity of the contract',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: ZPColors.red,
                      ),
                    );
            },
          ),
      ],
    );
  }
}

class QuantityIconShimmer extends StatelessWidget {
  const QuantityIconShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LoadingShimmer.withChild(
          child: QuantityIcon(
            pressed: () {},
            icon: Icons.remove,
            isEnabled: false,
          ),
        ),
        LoadingShimmer.withChild(
          child: QuantityIcon(
            pressed: () {},
            icon: Icons.remove,
            isEnabled: false,
          ),
        ),
      ],
    );
  }
}
