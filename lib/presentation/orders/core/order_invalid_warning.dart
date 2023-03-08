import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderInvalidWarning extends StatelessWidget {
  final bool isLoading;
  final bool isInvalidOrder;

  const OrderInvalidWarning({
    Key? key,
    required this.isLoading,
    required this.isInvalidOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox();
    }

    if (isInvalidOrder) {
      return Padding(
        key: const Key('invalidOrderWarning'),
        padding: const EdgeInsets.all(8.0),
        child: Row(
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
                'All Material Items are invalid and cannot be added to cart.'
                    .tr(),
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

    return const SizedBox();
  }
}
