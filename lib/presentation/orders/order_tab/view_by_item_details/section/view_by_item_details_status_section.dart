import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/custom_status_stepper.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderStatusSection extends StatelessWidget {
  final List<CustomStep> customStep;
  const OrderStatusSection({
    Key? key,
    required this.customStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
            title: Text(
              'Order Status'.tr(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            subtitle: const Text('Expected delivery:'),
          ),
          CustomStatusStepper(
            customStep: customStep,
          ),
          const _CloseButton(),
        ],
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.maxFinite, 55),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          'Close'.tr(),
          style: const TextStyle(color: ZPColors.white),
        ),
      ),
    );
  }
}
