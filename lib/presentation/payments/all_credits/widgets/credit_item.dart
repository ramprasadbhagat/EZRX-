part of 'package:ezrxmobile/presentation/payments/all_credits/all_credits.dart';

class _CreditsItem extends StatelessWidget {
  const _CreditsItem({
    Key? key,
    required this.creditItem,
  }) : super(key: key);

  final CreditAndInvoiceItem creditItem;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListTile(
        onTap: () => _onItemClick(context),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${creditItem.postingKeyName} #${creditItem.searchKey}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            StatusLabel(
              status: StatusType(
                creditItem.invoiceProcessingStatus.getOrDefaultValue(''),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: PriceComponent(
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              price: creditItem.convertIfAmountInTransactionCurrencyIsNegative
                  .toString(),
              priceLabelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ZPColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemClick(BuildContext context) {
    context.read<CreditAndInvoiceDetailsBloc>().add(
          CreditAndInvoiceDetailsEvent.fetch(
            creditAndInvoiceItem: creditItem,
            salesOrganisation:
                context.read<EligibilityBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
          ),
        );
    context.router.push(CreditDetailsPageRoute(creditItem: creditItem));
  }
}
