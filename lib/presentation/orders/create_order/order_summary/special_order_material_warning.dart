
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ContainsSpecialOrderMaterialWarning extends StatelessWidget {
  final bool containsSpecialOrderMaterial;
  final bool maxStepsReached;

  const ContainsSpecialOrderMaterialWarning({
    Key? key,
    required this.containsSpecialOrderMaterial,
    required this.maxStepsReached,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (containsSpecialOrderMaterial && maxStepsReached) {
      return Padding(
        key: const Key('containsSpecialOrderTypeMaterialWarning'),
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
                'Regular orders cannot contain only sample and/or FOC materials. Please add a commercial material to proceed.'
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

    return const SizedBox();
  }
}
