import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/order_number_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_attachment_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/invoice_number_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewByItemDetailsHeaderSection extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final OrderHistoryBasicInfo orderHistoryBasicInfo;
  const ViewByItemDetailsHeaderSection({
    Key? key,
    required this.orderHistoryItem,
    required this.orderHistoryBasicInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Container(
      color: ZPColors.primary,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderNumberSection(
            orderHistoryItem: orderHistoryItem,
          ),
          const SizedBox(
            height: 10,
          ),
          BalanceTextRow(
            valueFlex: 1,
            key: WidgetKeys.viewByItemsOrderDetailOrderDate,
            keyText: context.tr('Order date'),
            valueText: orderHistoryItem.createdDate.dateString,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
          InvoiceNumberSection(
            key: WidgetKeys.viewByItemsOrderDetailInvoiceNumber,
            invoiceNumber: orderHistoryItem.invoiceData.invoiceNumber
                .getOrDefaultValue(''),
          ),
          BalanceTextRow(
            valueFlex: 1,
            key: WidgetKeys.viewByItemsOrderDetailPoReference,
            keyText: context.tr('PO reference'),
            valueText: orderHistoryItem.pOReference.displayPOReference,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
          config.enableFutureDeliveryDay
              ? BalanceTextRow(
                  valueFlex: 1,
                  key: WidgetKeys.viewByItemsOrderDetailsRequestedDeliveryDate,
                  keyText: context.tr('Requested Delivery Date'),
                  valueText: orderHistoryItem.requestedDeliveryDate.dateString,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                )
              : const SizedBox.shrink(),
          if (config.enableReferenceNote)
            BalanceTextRow(
              key: WidgetKeys.viewByItemsOrderDetailsReferenceNote,
              valueFlex: 1,
              keyText: 'Reference Note',
              valueText: orderHistoryItem.referenceNotes.displayDashIfEmpty,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
          if (!config.disablePaymentTermsDisplay)
            LoadingShimmer.withChild(
              enabled:
                  context.read<ViewByItemDetailsBloc>().state.isDetailsLoading,
              child: BalanceTextRow(
                key: WidgetKeys.paymentTerm,
                keyText: context.tr('Payment Term'),
                valueFlex: 1,
                valueText: orderHistoryBasicInfo.paymentTerm.displayValue,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
            ),
          config.enableMobileNumber
              ? BalanceTextRow(
                  valueFlex: 1,
                  key: WidgetKeys.viewByItemsOrderDetailsContactPerson,
                  keyText: context.tr('Contact person'),
                  valueText: orderHistoryItem.orderBy.displayNAIfEmpty,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                )
              : const SizedBox.shrink(),
          config.enableMobileNumber
              ? BalanceTextRow(
                  valueFlex: 1,
                  key: WidgetKeys.viewByItemsOrderDetailsContactNumber,
                  keyText: context.tr('Contact number'),
                  valueText:
                      orderHistoryItem.telephoneNumber.displayTelephoneNumber,
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                )
              : const SizedBox.shrink(),
          if (config.enableSpecialInstructions)
            BalanceTextRow(
              valueFlex: 1,
              keyText: context.tr('Delivery instructions'),
              valueText: orderHistoryItem
                  .specialInstructions.displaySpecialInstructions,
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
          if (config.showPOAttachment) const ViewByItemAttachmentSection(),
        ],
      ),
    );
  }
}
