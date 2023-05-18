import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class PaymentSummaryTile extends StatelessWidget {
  final PaymentSummaryDetails paymentSummaryDetails;
  const PaymentSummaryTile({
    Key? key,
    required this.paymentSummaryDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configs = context.read<SalesOrgBloc>().state.configs;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BalanceTextRow(
                keyText: 'Date Created'.tr(),
                valueText:
                    paymentSummaryDetails.createdDate.toValidDateStringNaIfEmpty.tr(),
                keyFlex: 1,
                valueFlex: 1,
              ),
              BalanceTextRow(
                keyText: 'Payment Date'.tr(),
                valueText:
                    paymentSummaryDetails.valueDate.toValidDateStringNaIfEmpty,
                valueFlex: 1,
              ),
              BalanceTextRow(
                keyText: 'Payment Advice'.tr(),
                valueText: paymentSummaryDetails.zzAdvice.displayStringValue,
                keyFlex: 1,
                valueFlex: 1,
              ),
              BalanceTextRow(
                keyText: 'Advice Expiry'.tr(),
                valueText:
                    paymentSummaryDetails.adviceExpiry.getOrDefaultValue(''),
                valueColor: paymentSummaryDetails.adviceExpiry.getPaymentAdviceColor,
                keyFlex: 1,
                valueFlex: 1,
              ),
              BalanceTextRow(
                keyText: 'Payment Due'.tr(),
                valueText: StringUtils.displayPrice(
                    configs, paymentSummaryDetails.paymentAmount,),
                keyFlex: 1,
                valueFlex: 1,
              ),
              BalanceTextRow(
                keyText: 'Payment Status'.tr(),
                valueText: paymentSummaryDetails.status,
                isStatus: true,
                keyFlex: 1,
                valueFlex: 1,
              ),
            ],
          ),
      ),
    );
  }
}
