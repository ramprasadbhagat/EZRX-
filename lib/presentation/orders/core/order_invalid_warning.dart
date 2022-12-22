import 'package:easy_localization/easy_localization.dart';
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
        padding: const EdgeInsets.only(
          right: 10,
          left: 10,
          top: 5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.info_outlined,
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'All materials are invalid and can not be added to cart!'
                        .tr(),
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox();
  }
}
