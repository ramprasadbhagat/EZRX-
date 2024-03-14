import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressInfoSection extends StatelessWidget {
  final String actionText;
  final Color? backgroundColor;
  final Color? infoTextColor;
  final EdgeInsets padding;

  const AddressInfoSection._({
    Key? key,
    required this.actionText,
    this.backgroundColor,
    this.infoTextColor,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  factory AddressInfoSection.order() =>
      const AddressInfoSection._(actionText: 'Order for');

  factory AddressInfoSection.returnRequest() =>
      const AddressInfoSection._(actionText: 'Return for');

  factory AddressInfoSection.noAction() =>
      const AddressInfoSection._(actionText: '');

  factory AddressInfoSection.greenBackground({
    EdgeInsets padding = EdgeInsets.zero,
    String actionText = '',
  }) =>
      AddressInfoSection._(
        actionText: actionText,
        backgroundColor: ZPColors.primary,
        infoTextColor: ZPColors.white,
        padding: padding,
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      builder: (context, state) {
        return Container(
          color: backgroundColor,
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              actionText.isEmpty
                  ? Text(
                      state.customerCodeInfo.customerName.name1,
                      key: WidgetKeys.addressInfoSectionActionLabel,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: infoTextColor,
                          ),
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
                                ?.copyWith(color: infoTextColor),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '${'Customer code'.tr()}: ${state.customerCodeInfo.customerCodeSoldTo}',
                  key: WidgetKeys.addressInfoSectionCustomerCodeLabel,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: infoTextColor,
                      ),
                ),
              ),
              Text(
                state.customerCodeInfo.fullCustomerAddress,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: infoTextColor,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '${'Delivery to'.tr()}: ${state.shipToInfo.shipToCustomerCode}',
                key: WidgetKeys.addressInfoSectionDeliveryToLabel,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: infoTextColor,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                state.shipToInfo.fullDeliveryAddress,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: infoTextColor,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
