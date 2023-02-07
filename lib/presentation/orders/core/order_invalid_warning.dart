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
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Row(
          children: [
            const Icon(
              Icons.warning_amber,
              color: ZPColors.tender,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                'All materials are invalid and can not be added to cart!'.tr(),
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.tender,
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
