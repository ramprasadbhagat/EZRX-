part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart';

class _InvoiceCreditItemTile extends StatelessWidget {
  final CustomerOpenItem customerOpenItem;

  const _InvoiceCreditItemTile({
    Key? key,
    required this.customerOpenItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${customerOpenItem.postingKeyName} #${customerOpenItem.accountingDocument}',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  customerOpenItem.netDueDate.dateString,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                ),
                PriceComponent(
                  salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                  price:
                      customerOpenItem.amountInTransactionCurrency.toString(),
                ),
              ],
            ),
          ),
          const Divider(
            height: 30,
            endIndent: 0,
            indent: 0,
            color: ZPColors.extraLightGrey3,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
