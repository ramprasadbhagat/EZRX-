import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuantityInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(int) onFieldChange;
  final Function(int) minusPressed;
  final Function(int) addPressed;
  const QuantityInput({
    Key? key,
    required this.controller,
    required this.onFieldChange,
    required this.minusPressed,
    required this.addPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _QuantityIcon(
          pressed: () {
            if (int.parse(controller.text) > 1) {
              FocusScope.of(context).unfocus();
              final value = int.parse(controller.text) - 1;
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
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: <TextInputFormatter>[
              // Only digits
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              // Prevent leading zero
              FilteringTextInputFormatter.deny(RegExp(r'^0+')),
            ],
            onChanged: (String text) {
              final newValue = text;
              // if (text.isEmpty || int.parse(text) <= 0) {
              //   newValue = '1';
              // } else if (int.parse(text) >= 999999) {
              //   newValue = '999999';
              // }
              // controller.value = TextEditingValue(
              //   text: newValue,
              //   selection: TextSelection.collapsed(offset: newValue.length),
              // );
              onFieldChange(int.parse(newValue));
            },
            decoration: const InputDecoration(isDense: true),
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
        minimumSize: const Size(30, 30),
        fixedSize: const Size(30, 30),
        padding: EdgeInsets.zero,
        backgroundColor: ZPColors.primary,
      ),
      child: Icon(icon, color: ZPColors.white),
      onPressed: () => pressed(),
    );
  }
}
