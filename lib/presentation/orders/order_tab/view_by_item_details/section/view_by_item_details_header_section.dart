import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_attachment_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewByItemDetailsHeaderSection extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  const ViewByItemDetailsHeaderSection({
    Key? key,
    required this.orderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemDetailsBloc, ViewByItemDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
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
              Text(
                '${context.tr('Order')} #${orderHistoryItem.orderNumber.getOrDefaultValue('')}',
                key: WidgetKeys.viewByItemsOrderDetailOrderCode,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              BalanceTextRow(
                key: WidgetKeys.viewByItemsOrderDetailOrderDate,
                keyText: context.tr('Order date'),
                valueText: orderHistoryItem.createdDate.dateString,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              BalanceTextRow(
                key: WidgetKeys.viewByItemsOrderDetailInvoiceNumber,
                keyText: context.tr('Invoice number'),
                valueText: orderHistoryItem.invoiceNumber,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              BalanceTextRow(
                key: WidgetKeys.viewByItemsOrderDetailPoReference,
                keyText: context.tr('PO reference'),
                valueText: orderHistoryItem.pOReference.displayPOReference,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              config.enableFutureDeliveryDay
                  ? BalanceTextRow(
                      keyText: context.tr('Requested Delivery Date'),
                      valueText:
                          orderHistoryItem.requestedDeliveryDate.dateString,
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
              //TODO:will add value after getting data  from orderHistoryv2 api for these fields
              //       BalanceTextRow(
              //   keyText: 'Reference Note',
              //   valueText: orderHistoryItem.,
              // ),
              // paymentTermDisplay
              // ? BalanceTextRow(
              //   keyText: 'Payment Term',
              //   valueText:
              //       orderHistoryItem.,
              // ): const SizedBox.shrink(),
              config.enableMobileNumber
                  ? BalanceTextRow(
                      keyText: context.tr('Contact person'),
                      valueText: orderHistoryItem.orderBy,
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
                      keyText: context.tr('Contact number'),
                      valueText: orderHistoryItem
                          .telephoneNumber.displayTelephoneNumber,
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
                  keyText: context.tr('Delivery instructions'),
                  valueText: orderHistoryItem
                      .specialInstructions.displaySpecialInstructions,
                  valueTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                  keyTextStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (config.showPOAttachment) const ViewByItemAttachmentSection(),
            ],
          ),
        );
      },
    );
  }
}
