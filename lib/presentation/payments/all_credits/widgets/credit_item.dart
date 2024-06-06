part of 'package:ezrxmobile/presentation/payments/all_credits/all_credits.dart';

class _CreditsItem extends StatelessWidget {
  const _CreditsItem({
    required this.creditItem,
  });

  final CreditAndInvoiceItem creditItem;

  @override
  Widget build(BuildContext context) {
    final isIDMarket = context.read<EligibilityBloc>().state.isIDMarket;

    return CustomCard(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListTile(
        key: WidgetKeys.creditsItemTile,
        onTap: !isIDMarket ? () => _onItemClick(context) : null,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (context.isMPPayment) ...[
                  MarketPlaceLogo.small(),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Text(
                    '${context.tr('Account credit')} #${creditItem.searchKey.displayNAIfEmpty}',
                    key: WidgetKeys.creditItemId(
                      creditItem.searchKey.getOrDefaultValue(''),
                    ),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                if (!isIDMarket)
                  StatusLabel(
                    key: WidgetKeys.creditStatusTag,
                    status: StatusType(
                      creditItem.invoiceProcessingStatus.getOrDefaultValue(''),
                    ),
                  ),
              ],
            ),
            if (context.read<EligibilityBloc>().state.salesOrg.showGovNumber)
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  '${context.tr('Gov. no')} ${creditItem.documentReferenceID.displayDashIfEmpty}',
                  key: WidgetKeys.governmentNumber,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  creditItem.accountingDocumentType,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: creditItem.convertIfAmountInTransactionCurrencyIsNegative
                    .toString(),
                priceLabelStyle:
                    Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ZPColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemClick(BuildContext context) {
    trackMixpanelEvent(TrackingEvents.paymentDocumentViewed);
    context.read<CreditAndInvoiceDetailsBloc>().add(
          CreditAndInvoiceDetailsEvent.fetch(
            creditAndInvoiceItem: creditItem,
            isMarketPlace: context.isMPPayment,
          ),
        );
    context.read<DownloadECreditBloc>().add(
          DownloadECreditEvent.fetchECreditDownloadUrl(
            eCredit: creditItem.searchKey.getOrDefaultValue(''),
          ),
        );
    context.router
        .push(CreditDetailsPageRoute(isMarketPlace: context.isMPPayment));
  }
}
