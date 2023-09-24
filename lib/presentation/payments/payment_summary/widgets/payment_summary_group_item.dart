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
    return CustomCard(
      margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      child: ListTile(
        onTap: () {
          context.read<PaymentItemBloc>().add(
                PaymentItemEvent.fetchPaymentItemList(
                  salesOrganization:
                      context.read<EligibilityBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<EligibilityBloc>().state.customerCodeInfo,
                  paymentID: paymentSummaryDetails.paymentID,
                  paymentBatchAdditionalInfo:
                      paymentSummaryDetails.paymentBatchAdditionalInfo,
                  accountingDocExternalReference:
                      paymentSummaryDetails.accountingDocExternalReference,
                ),
              );
          context.router.push(
            PaymentSummaryDetailsPageRoute(
              paymentSummaryDetails: paymentSummaryDetails,
            ),
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
                '${context.tr('PA')} #${paymentSummaryDetails.zzAdvice.displayDashIfEmpty}',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                paymentSummaryDetails.dateOrExpiry,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: paymentSummaryDetails
                          .status.getPaymentDisplayStatusTextColor,
                    ),
              ),
              const SizedBox(height: 10),
              PriceComponent(
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
