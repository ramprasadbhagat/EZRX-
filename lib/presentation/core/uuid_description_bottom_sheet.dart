import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class UuidDescriptionBottomSheet extends StatelessWidget {
  const UuidDescriptionBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.tr('What\'s this number?'),
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: ZPColors.primary),
          ),
          const SizedBox(height: 10),
          Text(
            context.tr(
              'Your order has been placed on ezrx but has not yet been made on SAP, and it will be queued in the SAP system to be created.',
            ),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.maxFinite, 50),
              ),
              onPressed: () => context.router.pop(),
              child: Text(
                context.tr('Close'),
                style: const TextStyle(color: ZPColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
