import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryInfoBottomSheet extends StatelessWidget {
  final SummaryInfoActionType actionType;
  const SummaryInfoBottomSheet({
    Key? key,
    required this.actionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SummaryInfo(
              actionType: actionType,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.router.pop();
                },
                child: Text(
                  'Close'.tr(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryInfo extends StatelessWidget {
  final SummaryInfoActionType actionType;
  const _SummaryInfo({
    Key? key,
    required this.actionType,
  }) : super(key: key);

  String _getActionTypeText() {
    switch (actionType) {
      case SummaryInfoActionType.order:
        return 'Order';
      case SummaryInfoActionType.returnRequest:
        return 'Return';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_getActionTypeText().tr()} for ${context.read<CustomerCodeBloc>().state.customerCodeInfo.customerName}',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          '${'Customer code'.tr()}: ${context.read<CustomerCodeBloc>().state.customerCodeInfo.customerCodeSoldTo}',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          context
              .read<CustomerCodeBloc>()
              .state
              .customerCodeInfo
              .fullCustomerAddress,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          '${'Deliver to'.tr()}: ${context.read<CustomerCodeBloc>().state.shipToInfo.shipToCustomerCode}',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          context.read<CustomerCodeBloc>().state.shipToInfo.deliveryAddress,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
      ],
    );
  }
}

enum SummaryInfoActionType {
  order,
  returnRequest,
}
