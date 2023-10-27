part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryGroupItem extends StatelessWidget {
  final PaymentSummaryGroup paymentSummaryGroup;
  final bool showDivider;

  const _PaymentSummaryGroupItem({
    Key? key,
    required this.paymentSummaryGroup,
    required this.showDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDivider)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 16),
          child: Text(
            '${context.tr('Created on')} ${paymentSummaryGroup.createdDate.dateString}',
            key: WidgetKeys.paymentSummaryGroupDate,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.apply(color: ZPColors.lightGray),
          ),
        ),
        ...paymentSummaryGroup.paymentSummaryDetails
            .map(
              (e) => _PaymentSummaryItem(
                paymentSummaryDetails: e,
              ),
            )
            .toList(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _PaymentSummaryItem extends StatelessWidget {
  final PaymentSummaryDetails paymentSummaryDetails;

  const _PaymentSummaryItem({
    Key? key,
    required this.paymentSummaryDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrg = context.read<EligibilityBloc>().state.salesOrg;

    return CustomCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: ListTile(
        key: WidgetKeys.paymentSummaryTile,
        onTap: () {
          trackMixpanelEvent(MixpanelEvents.paymentDocumentViewed);
          context.read<PaymentSummaryDetailsBloc>().add(
                PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
                  salesOrganization:
                      context.read<EligibilityBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<EligibilityBloc>().state.customerCodeInfo,
                  paymentSummaryDetails: paymentSummaryDetails,
                ),
              );
          context.router.push(
            const PaymentSummaryDetailsPageRoute(),
          );
        },
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '${salesOrg.paymentIdPretext} #${paymentSummaryDetails.zzAdvice.displayDashIfEmpty}',
                key: WidgetKeys.commonTileItemLabel,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            StatusLabel(
              key: WidgetKeys.paymentSummaryTileStatus,
              status:
                  StatusType(paymentSummaryDetails.status.displayStatusText),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                paymentSummaryDetails.status.isInProgress
                    ? '${context.tr('Expires in')} ${paymentSummaryDetails.adviceExpiry.displayDashIfEmpty}'
                    : '${context.tr(salesOrg.paymentDateLabelText)}: ${paymentSummaryDetails.createdDate.dateString}',
                key: WidgetKeys.paymentSummaryDateOrExpiry,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: paymentSummaryDetails
                          .status.getPaymentDisplayStatusTextColor,
                    ),
              ),
              const SizedBox(height: 10),
              PriceComponent(
                key: WidgetKeys.paymentSummaryAmountAndCurrency,
                price: paymentSummaryDetails.paymentAmount.toString(),
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                priceLabelStyle: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
