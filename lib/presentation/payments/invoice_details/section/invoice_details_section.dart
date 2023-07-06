import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceDetailsSection extends StatelessWidget {
  final CreditAndInvoiceItem invoiceItem;
  const InvoiceDetailsSection({
    Key? key,
    required this.invoiceItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return custom.ExpansionTile(
      initiallyExpanded: true,
      keepHeaderBorder: true,
      title: Text(
        'Invoice Details'.tr(),
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      children: [
        BalanceTextRow(
          keyFlex: 3,
          valueFlex: 5,
          keyText: 'Due Date'.tr(),
          valueText: invoiceItem.netDueDate.toValidDateString,
        ),
        const SizedBox(height: 8),
        BalanceTextRow(
          keyFlex: 3,
          valueFlex: 5,
          keyText: 'Invoice Number'.tr(),
          valueText: invoiceItem.invoiceReference.displayStringValue,
        ),
        const SizedBox(height: 8),
        BalanceTextRow(
          keyFlex: 3,
          valueFlex: 5,
          keyText: 'Invoice Date'.tr(),
          valueText: invoiceItem.postingDate.toValidDateString,
        ),
        const SizedBox(height: 8),
        BalanceTextRow(
          keyFlex: 3,
          valueFlex: 5,
          keyText: 'Invoice Amount'.tr(),
          valueText: StringUtils.displayPrice(
            salesOrgConfigs,
            invoiceItem.amountInTransactionCurrency,
          ),
        ),
        const SizedBox(height: 8),
        BalanceTextRow(
          keyFlex: 3,
          valueFlex: 5,
          keyText: 'Order ID'.tr(),
          valueText: invoiceItem.orderId,
        ),
        const SizedBox(height: 8),
        BalanceTextRow(
          keyFlex: 3,
          valueFlex: 5,
          keyText: 'Status'.tr(),
          valueText: invoiceItem.invoiceProcessingStatus.getOrDefaultValue(''),
          isStatus: true,
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: invoiceItem.invoiceProcessingStatus.displayDueDateColor,
              ),
        ),
      ],
    );
  }
}
