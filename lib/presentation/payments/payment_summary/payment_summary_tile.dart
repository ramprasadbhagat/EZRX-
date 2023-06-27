//ignore_for_file: unused-code

//ignore_for_file: unused-class

//ignore_for_file: unused-files
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_group.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';

class PaymentSummaryGroupSection extends StatelessWidget {
  const PaymentSummaryGroupSection({
    Key? key,
    required this.paymentSummaryGroup,
    required this.showDivider,
  }) : super(key: key);
  final PaymentSummaryGroup paymentSummaryGroup;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDivider)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 16),
              child: Text(
                'Created on ${paymentSummaryGroup.createdDate.toValidDateString}',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.apply(color: ZPColors.lightGray),
              ),
            ),
            Column(
              children: [
                ...paymentSummaryGroup.paymentSummaryDetails
                    .map((e) => _PaymentSummaryTiles(
                          paymentSummaryDetails: e,
                        )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}

class _PaymentSummaryTiles extends StatelessWidget {
  const _PaymentSummaryTiles({Key? key, required this.paymentSummaryDetails})
      : super(key: key);
  final PaymentSummaryDetails paymentSummaryDetails;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                'Payment #${paymentSummaryDetails.zzAdvice.displayStringValue}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            StatusLabel(
              status:
                  StatusType(paymentSummaryDetails.status.displayStringValue),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                paymentSummaryDetails.status.message(paymentSummaryDetails),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: paymentSummaryDetails
                          .status.getPaymentDisplayStatusTextColor,
                    ),
              ),
              PriceComponent(
                price: paymentSummaryDetails.paymentAmount.toString(),
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                currencyCodeTextStyle:
                    Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: ZPColors.darkGray,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
