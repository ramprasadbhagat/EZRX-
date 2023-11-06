import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
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
    final eligibilityState = context.read<EligibilityBloc>().state;

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
                '${context.tr('Order')} #${orderDetails.orderNumber.getOrDefaultValue('')}',
                key: WidgetKeys.viewByOrderDetailOrderCode,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              const SizedBox(height: 10),
              BalanceTextRow(
                key: WidgetKeys.viewByOrderDetailOrderDate,
                keyText: context.tr('Order date'),
                valueText: orderDetails.createdDate.dateString,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
                keyFlex: 8,
                valueFlex: 7,
              ),
              BalanceTextRow(
                keyText: context.tr('PO reference'),
                valueText: orderDetails.pOReference.displayPOReference,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
                keyFlex: 8,
                valueFlex: 7,
              ),
              if (eligibilityState.salesOrgConfigs.enableFutureDeliveryDay)
                BalanceTextRow(
                  keyText: context.tr('Requested Delivery Date'),
                  valueText:
                      orderDetails.requestedDeliveryDate.dateTimeOrNaString,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  keyFlex: 8,
                  valueFlex: 7,
                ),
              if (eligibilityState.salesOrgConfigs.enableReferenceNote)
                BalanceTextRow(
                  keyText: context.tr('Reference Note'),
                  valueText: orderDetails.referenceNotes,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  keyFlex: 8,
                  valueFlex: 7,
                ),
              if (eligibilityState.displayPaymentTerm)
                BalanceTextRow(
                  key: WidgetKeys.paymentTermKey,
                  keyText: context.tr('Payment Term'),
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
                  keyFlex: 8,
                  valueFlex: 7,
                ),
              if (eligibilityState.salesOrgConfigs.enableMobileNumber) ...[
                BalanceTextRow(
                  keyText: context.tr('Contact person'),
                  valueText: orderDetails.orderBy,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  keyFlex: 8,
                  valueFlex: 7,
                ),
                BalanceTextRow(
                  keyText: context.tr('Contact number'),
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
                  keyFlex: 8,
                  valueFlex: 7,
                ),
              ],
              if (eligibilityState.salesOrgConfigs.enableSpecialInstructions)
                BalanceTextRow(
                  keyText: context.tr('Delivery instructions'),
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
                  keyFlex: 8,
                  valueFlex: 7,
                ),
              if (eligibilityState.salesOrgConfigs.showPOAttachment)
                const AttachmentSection(),
            ],
          ),
        );
      },
    );
  }
}
