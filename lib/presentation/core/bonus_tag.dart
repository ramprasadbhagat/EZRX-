import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BonusTag extends StatelessWidget {
  const BonusTag({Key? key, this.margin = const EdgeInsets.all(0)})
      : super(key: key);
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      margin: margin,
      decoration: const BoxDecoration(
        color: ZPColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        'Bonus'.tr(),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: ZPColors.white,
            ),
      ),
    );
  }
}
