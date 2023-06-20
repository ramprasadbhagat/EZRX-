//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AttentionRow extends StatelessWidget {
  final String valueText;

  const AttentionRow({
    Key? key,
    required this.valueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.info_outline_rounded,
            color: ZPColors.darkerGreen,
            size: 18,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              valueText.tr(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
