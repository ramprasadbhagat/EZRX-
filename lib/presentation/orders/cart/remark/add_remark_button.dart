import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AddRemarksButton extends StatelessWidget {
  const AddRemarksButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      key: Key('$key-InkWell'),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        visualDensity: VisualDensity.compact,
      ),
      icon: const Icon(
        Icons.add,
        color: ZPColors.kPrimaryColor,
      ),
      label: Text(
        'Add Remarks',
        style: Theme.of(context).textTheme.titleSmall?.apply(
              color: ZPColors.kPrimaryColor,
            ),
      ).tr(),
    );
  }
}
