import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ReturnTypeInfoBottomSheet extends StatelessWidget {
  final ReturnType returnType;
  const ReturnTypeInfoBottomSheet({
    Key? key,
    required this.returnType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${'Type'.tr()}: ${returnType.returnTypeValue}',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: ZPColors.primary),
          ),
          const SizedBox(height: 10),
          Text(
            returnType.returnTypeBottomASheetBodyText,
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
                context.tr('Got it'),
                style: const TextStyle(color: ZPColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
