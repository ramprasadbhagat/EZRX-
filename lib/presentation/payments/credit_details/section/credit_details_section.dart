import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditDetailsSection extends StatelessWidget {
  final CreditAndInvoiceItem creditItem;
  const CreditDetailsSection({
    Key? key,
    required this.creditItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return custom.ExpansionTile(
      initiallyExpanded: true,
      keepHeaderBorder: true,
      title: Text(
        'Credit Details'.tr(),
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      children: [
        BalanceTextRow(
          keyFlex: 3,
          valueFlex: 5,
          keyText: 'Credit Note Date'.tr(),
          valueText: creditItem.netDueDate.toValidDateString,
        ),
        const SizedBox(height: 8),
        BalanceTextRow(
          keyFlex: 3,
          valueFlex: 5,
          keyText: 'Credit Note Number'.tr(),
          valueText: creditItem.referenceDocumentNumber.displayStringValue,
        ),
        const SizedBox(height: 8),
        BalanceTextRow(
          keyFlex: 3,
          valueFlex: 5,
          keyText: 'Credit Date'.tr(),
          valueText: creditItem.postingDate.toValidDateString,
        ),
        const SizedBox(height: 8),
        BalanceTextRow(
          keyFlex: 3,
          valueFlex: 5,
          keyText: 'Credit Amount'.tr(),
          valueText: StringUtils.displayPrice(
            salesOrgConfigs,
            creditItem.convertIfAmountInTransactionCurrencyIsNegative,
          ),
        ),
        const SizedBox(height: 8),
        BalanceTextRow(
          keyFlex: 3,
          valueFlex: 5,
          keyText: 'Return ID'.tr(),
          valueText: creditItem.invoiceReference.displayStringValue,
        ),
        const SizedBox(height: 8),
        BalanceTextRow(
          keyFlex: 3,
          valueFlex: 5,
          keyText: 'Status'.tr(),
          valueText: creditItem.invoiceProcessingStatus,
          isStatus: true,
          valueColor: ZPColors.white,
        ),
      ],
    );
  }
}
