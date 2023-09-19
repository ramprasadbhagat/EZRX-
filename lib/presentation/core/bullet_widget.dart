import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BulletWidget extends StatelessWidget {
  final Widget content;
  final EdgeInsetsGeometry padding;
  const BulletWidget({
    Key? key,
    required this.content,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: content,
          ),
        ],
      ),
    );
  }
}
