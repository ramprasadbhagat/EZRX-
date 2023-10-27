import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressInfoSection extends StatelessWidget {
  final String actionText;

  const AddressInfoSection._({
    Key? key,
    required this.actionText,
  }) : super(key: key);

  factory AddressInfoSection.order() =>
      const AddressInfoSection._(actionText: 'Order for');

  factory AddressInfoSection.returnRequest() =>
      const AddressInfoSection._(actionText: 'Return for');

  factory AddressInfoSection.noAction() =>
      const AddressInfoSection._(actionText: '');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            actionText.isEmpty
                ? Text(
                    state.customerCodeInfo.customerName.name1,
                    key: WidgetKeys.addressInfoSectionActionLabel,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                : RichText(
                    key: WidgetKeys.addressInfoSectionActionLabel,
                    text: TextSpan(
                      text: '${actionText.tr()} ',
                      style: Theme.of(context).textTheme.labelMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: state.customerCodeInfo.customerName.name1,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: ZPColors.primary),
                        ),
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '${'Customer code'.tr()}: ${state.customerCodeInfo.customerCodeSoldTo}',
                key: WidgetKeys.addressInfoSectionCustomerCodeLabel,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Text(
              state.customerCodeInfo.fullCustomerAddress,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '${'Delivery to'.tr()}: ${state.shipToInfo.shipToCustomerCode}',
              key: WidgetKeys.addressInfoSectionDeliveryToLabel,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              state.shipToInfo.fullDeliveryAddress,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        );
      },
    );
  }
}
