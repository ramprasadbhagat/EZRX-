import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuantityInput extends StatelessWidget {
  final TextEditingController controller;
  final Key quantityTextKey;
  final Function(int) onFieldChange;
  final Function(int) minusPressed;
  final Function(int) addPressed;
  const QuantityInput({
    Key? key,
    required this.controller,
    required this.quantityTextKey,
    required this.onFieldChange,
    required this.minusPressed,
    required this.addPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: Row(
        children: [
          _QuantityIcon(
            pressed: () {
              FocusScope.of(context).unfocus();
              final value = int.parse(controller.text) - 1;
              final text = value.toString();
              controller.value = TextEditingValue(
                text: text,
                selection: TextSelection.collapsed(offset: text.length),
              );
              minusPressed(value);
            },
            icon: Icons.remove,
          ),
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
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          _QuantityIcon(
            pressed: () {
              FocusScope.of(context).unfocus();
              final value = int.parse(controller.text) + 1;
              final text = value.toString();
              controller.value = TextEditingValue(
                text: text,
                selection: TextSelection.collapsed(offset: text.length),
              );
              addPressed(value);
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}

class _QuantityIcon extends StatelessWidget {
  final Function pressed;
  final IconData icon;
  const _QuantityIcon({
    Key? key,
    required this.pressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(20, 20),
        fixedSize: const Size(20, 20),
        padding: EdgeInsets.zero,
        backgroundColor: ZPColors.primary,
      ),
      child: Icon(
        icon,
        color: ZPColors.white,
        size: 15,
      ),
      onPressed: () => pressed(),
    );
  }
}
