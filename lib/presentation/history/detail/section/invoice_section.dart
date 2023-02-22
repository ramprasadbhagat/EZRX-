import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;

class HistoryInvoiceSection extends StatelessWidget {
  const HistoryInvoiceSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return custom.ExpansionTile(
          initiallyExpanded: true,
          keepHeaderBorder: true,
          key: const ValueKey('invoices'),
          title: Text(
            'Invoices'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: state.orderHistoryDetails
                  .orderHistoryDetailsShippingInformation.invoices
                  .map((invoice) {
                return Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        BalanceTextRow(
                          keyText: 'Invoice Number'.tr(),
                          valueText: invoice.invoiceNumber,
                          valueTextLoading: state.isLoading,
                          keyFlex: 1,
                          valueFlex: 1,
                        ),
                        BalanceTextRow(
                          keyText: 'Invoice Date'.tr(),
                          valueText: invoice.invoiceDate.toValidDateString,
                          valueTextLoading: state.isLoading,
                          keyFlex: 1,
                          valueFlex: 1,
                        ),
                        BalanceTextRow(
                          keyText: 'Invoice Price'.tr(),
                          valueText: invoice.invoicePrice,
                          valueTextLoading: state.isLoading,
                          keyFlex: 1,
                          valueFlex: 1,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
