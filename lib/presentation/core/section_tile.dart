import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTapIconButton;
  const SectionTitle({
    Key? key,
    required this.title,
    required this.onTapIconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title.tr(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        IconButton(
          // key: WidgetKeys.iconArrow,
          key: WidgetKeys.sectionTileIcon(title),
          onPressed: onTapIconButton,
          visualDensity: VisualDensity.compact,
          icon: const CircleAvatar(
            backgroundColor: ZPColors.arrowButtonBackgroundColor,
            child: Icon(
              Icons.arrow_forward,
              size: 16,
              color: ZPColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
