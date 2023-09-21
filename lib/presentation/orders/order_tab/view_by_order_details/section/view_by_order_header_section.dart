import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/attachment_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHeaderSection extends StatelessWidget {
  const OrderHeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = context.read<SalesOrgBloc>().state.configs;

    return BlocBuilder<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        final orderDetails = state.orderHistoryDetails;

        return Container(
          color: ZPColors.primary,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'Order'.tr()} #${orderDetails.orderNumber.getOrDefaultValue('')}',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              BalanceTextRow(
                keyText: 'Order date'.tr(),
                valueText: orderDetails.createdDate.dateString,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              BalanceTextRow(
                keyText: 'PO reference'.tr(),
                valueText: orderDetails.pOReference.displayPOReference,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              if (config.enableFutureDeliveryDay)
                BalanceTextRow(
                  keyText: 'Requested Delivery Date'.tr(),
                  valueText: orderDetails.requestedDeliveryDate.dateString,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (config.enableReferenceNote)
                BalanceTextRow(
                  keyText: 'Reference Note'.tr(),
                  valueText: orderDetails.referenceNotes,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (!config.disablePaymentTermsDisplay)
                BalanceTextRow(
                  key: WidgetKeys.paymentTermKey,
                  keyText: 'Payment Term'.tr(),
                  valueText: orderDetails
                      .orderHistoryDetailsPaymentTerm.displayPaymentTerm,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (config.enableMobileNumber)
                BalanceTextRow(
                  keyText: 'Contact person'.tr(),
                  valueText: orderDetails.orderBy,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (config.enableMobileNumber)
                BalanceTextRow(
                  keyText: 'Contact number'.tr(),
                  valueText:
                      orderDetails.telephoneNumber.displayTelephoneNumber,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (config.enableSpecialInstructions)
                BalanceTextRow(
                  keyText: 'Delivery instructions'.tr(),
                  valueText: orderDetails.orderHistoryDetailsSpecialInstructions
                      .displaySpecialInstructions,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (config.showPOAttachment) const AttachmentSection(),
            ],
          ),
        );
      },
    );
  }
}
