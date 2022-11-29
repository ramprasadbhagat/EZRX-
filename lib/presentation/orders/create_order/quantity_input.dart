import 'package:ezrxmobile/presentation/orders/create_order/quantity_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuantityInput extends StatelessWidget {
  final TextEditingController controller;
  final Key quantityTextKey;
  final Function(int) onFieldChange;
  final Function(int) minusPressed;
  final Function(int) addPressed;
  final Key quantityAddKey;
  final Key quantityDeleteKey;
  const QuantityInput({
    Key? key,
    required this.controller,
    required this.quantityTextKey,
    required this.onFieldChange,
    required this.minusPressed,
    required this.addPressed,
    required this.quantityAddKey,
    required this.quantityDeleteKey,
  }) : super(key: key);

  static const minimumQty = 0;
  static const maximumQty = 100000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 50,
          child: TextField(
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
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Row(
          children: [
            QuantityIcon(
              key: quantityDeleteKey,
              pressed: () {
                FocusScope.of(context).unfocus();
                final value = (int.tryParse(controller.text) ?? 0) - 1;
                if (value > minimumQty) {
                  final text = value.toString();
                  controller.value = TextEditingValue(
                    text: text,
                    selection: TextSelection.collapsed(offset: text.length),
                  );
                  minusPressed(value);
                }
              },
              icon: Icons.remove,
            ),
            QuantityIcon(
              key: quantityAddKey,
              pressed: () {
                FocusScope.of(context).unfocus();
                final value = (int.tryParse(controller.text) ?? 0) + 1;

                if (value < maximumQty) {
                  final text = value.toString();
                  controller.value = TextEditingValue(
                    text: text,
                    selection: TextSelection.collapsed(offset: text.length),
                  );
                  addPressed(value);
                }
              },
              icon: Icons.add,
            ),
          ],
        ),
      ],
    );
  }
}
