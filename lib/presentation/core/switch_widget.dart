import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  final bool value;
  final bool disable;
  final Function(bool)? onChanged;
  const SwitchWidget({
    super.key,
    this.disable = false,
    this.value = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeTrackColor:
          disable ? ZPColors.toggleOnDisableState : ZPColors.textButtonColor,
      inactiveTrackColor: ZPColors.lightGrey,
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) => ZPColors.white,
      ),
      thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return const Icon(
              Icons.check,
              color: ZPColors.textButtonColor,
            );
          }

          return const Icon(
            Icons.close,
            color: ZPColors.lightGrey,
          );
        },
      ),
      value: value,
      onChanged: disable ? null : onChanged,
    );
  }
}
