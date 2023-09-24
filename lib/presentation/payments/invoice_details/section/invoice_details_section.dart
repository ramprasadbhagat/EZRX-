import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';

class InvoiceDetailsSection extends StatelessWidget {
  final CreditAndInvoiceItem invoiceItem;
  const InvoiceDetailsSection({
    Key? key,
    required this.invoiceItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(color: ZPColors.primary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BalanceTextRow(
            keyText:
                '${context.tr('Invoice')} #${invoiceItem.referenceDocumentNumber.getOrDefaultValue('')}',
            isStatus: true,
            valueText:
                invoiceItem.invoiceProcessingStatus.getOrDefaultValue(''),
            keyTextStyle: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: ZPColors.white),
          ),
          const SizedBox(height: 8),
          BalanceTextRow(
            keyFlex: 2,
            valueFlex: 3,
            isStatus: false,
            keyText: context.tr('Document date'),
            valueText: invoiceItem.postingDate.dateString,
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
          const SizedBox(height: 8),
          BalanceTextRow(
            keyFlex: 2,
            valueFlex: 3,
            keyText: context.tr('Due on'),
            valueText: StringUtils.getDueDateString(
              invoiceItem.netDueDate.dateTimeOrNull,
              context.read<SalesOrgBloc>().state.salesOrganisation,
            ),
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
          const SizedBox(height: 8),
          BalanceTextRow(
            keyFlex: 2,
            valueFlex: 3,
            keyText: context.tr('Order number'),
            valueText: invoiceItem.orderId.displayNAIfEmpty,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
        ],
      ),
    );
  }
}
