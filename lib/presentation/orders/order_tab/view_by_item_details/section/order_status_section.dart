import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/custom_status_stepper.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderStatusSection extends StatelessWidget {
  final List<CustomStep> customStep;
  final OrderHistoryItem orderHistoryItem;

  const OrderStatusSection({
    Key? key,
    required this.customStep,
    required this.orderHistoryItem,
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
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: ZPColors.primary),
            ),
            subtitle: !context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .disableDeliveryDate
                ? Text(
                    '${'Expected delivery'.tr()}: ${orderHistoryItem.deliveryDate.dateString}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                : const SizedBox.shrink(),
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
