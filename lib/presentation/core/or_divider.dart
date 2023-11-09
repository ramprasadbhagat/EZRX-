import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(
            indent: 0,
            thickness: 0.5,
          ),
        ),
        Text(
          context.tr('or'),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ZPColors.dividerColor,
              ),
        ),
        const Expanded(
          child: Divider(
            endIndent: 0,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
