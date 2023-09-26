part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _PaymentItemSection extends StatelessWidget {
  const _PaymentItemSection({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      buildWhen: (previous, current) =>
          previous.isListLoading != current.isListLoading ||
          previous.isDetailFetching != current.isDetailFetching,
      builder: (context, state) {
        return state.isLoading
            ? LoadingShimmer.tile()
            : Column(
                children: [
                  ...state.paymentItemList.map(
                    (e) => _PaymentItem(
                      paymentItem: e,
                      showDivider: state.paymentItemList.indexOf(e) != 0,
                    ),
                  ),
                ],
              );
      },
    );
  }
}

class _PaymentItem extends StatelessWidget {
  const _PaymentItem({
    Key? key,
    required this.paymentItem,
    required this.showDivider,
  }) : super(key: key);
  final PaymentItem paymentItem;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Column(
        children: [
          if (showDivider)
            const Divider(
              indent: 0,
              height: 20,
              endIndent: 0,
              color: ZPColors.lightGray2,
            ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            title: Text(
              '${paymentItem.postingKeyName} #${paymentItem.searchKey}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    paymentItem.documentDate.dateString,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  PriceComponent(
                    salesOrgConfig:
                        context.read<EligibilityBloc>().state.salesOrgConfigs,
                    price: paymentItem.paymentAmountInDisplayCrcy.toString(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
