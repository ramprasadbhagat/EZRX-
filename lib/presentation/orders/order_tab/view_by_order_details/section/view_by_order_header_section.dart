import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHeaderSection extends StatelessWidget {
  final OrderHistoryDetailsOrderHeader viewByOrderHistoryItem;

  const OrderHeaderSection({
    Key? key,
    required this.viewByOrderHistoryItem,
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
                'Order #${viewByOrderHistoryItem.orderNumber.getOrDefaultValue('')}',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              BalanceTextRow(
                keyText: 'Order date'.tr(),
                valueText: viewByOrderHistoryItem.createdDate.dateString,
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
                valueText: orderDetails.orderHistoryDetailsOrderHeader
                    .pOReference.displayPOReference,
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
                      keyText: 'Requested Delivery Date'.tr(),
                      valueText: orderDetails.orderHistoryDetailsOrderHeader
                          .requestedDeliveryDate.dateString,
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
              config.enableReferenceNote
                  ? BalanceTextRow(
                      keyText: 'Reference Note'.tr(),
                      valueText: orderDetails
                          .orderHistoryDetailsOrderHeader.referenceNotes,
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
              config.enablePaymentTerms
                  ? BalanceTextRow(
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
                    )
                  : const SizedBox.shrink(),
              config.enableMobileNumber
                  ? BalanceTextRow(
                      keyText: 'Contact person'.tr(),
                      valueText:
                          orderDetails.orderHistoryDetailsOrderHeader.orderBy,
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
                      keyText: 'Contact number'.tr(),
                      valueText: orderDetails.orderHistoryDetailsOrderHeader
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
              config.enableSpecialInstructions
                  ? BalanceTextRow(
                      keyText: 'Delivery instructions'.tr(),
                      valueText: orderDetails
                          .orderHistoryDetailsSpecialInstructions
                          .displaySpecialInstructions,
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
            ],
          ),
        );
      },
    );
  }
}
