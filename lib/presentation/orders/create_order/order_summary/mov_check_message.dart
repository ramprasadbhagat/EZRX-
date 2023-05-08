
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class MovCheckMessage extends StatelessWidget {
  final bool isMovQualified;
  final bool maxStepsReached;
  const MovCheckMessage({
    Key? key,
    required this.isMovQualified,
    required this.maxStepsReached,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(!isMovQualified && maxStepsReached){
      return Padding(
        key: const Key('MovCheckMessage'),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.info_outline_rounded,
              color: ZPColors.red,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                'Note : Minimum order value criteria does not match! Please update your cart to proceed.'
                    .tr(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: ZPColors.error,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
