import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ValidationsFailedWarning extends StatelessWidget {
  const ValidationsFailedWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: ZPColors.lightRedStatusColor,
      ),
      child: Text(
        context.tr(
          'Please ensure all requirements are met for your new password.',
        ),
        style: Theme.of(context).textTheme.titleSmall,
        key: WidgetKeys.errorRequirementsFillAllField,
      ),
    );
  }
}
