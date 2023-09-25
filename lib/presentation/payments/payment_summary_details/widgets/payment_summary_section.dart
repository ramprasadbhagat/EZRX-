part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _PaymentSummarySection extends StatelessWidget {
  const _PaymentSummarySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      buildWhen: (previous, current) =>
          previous.isListLoading != current.isListLoading ||
          previous.isDetailFetching != current.isDetailFetching,
      builder: (context, state) {
        return state.isLoading || state.paymentItemList.isEmpty
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment summary'.tr(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _PriceWidget(
                      title: 'Invoice total:',
                      price: state.paymentItemList.invoiceTotal.toString(),
                      type: PriceStyle.totalPrice,
                    ),
                    _PriceWidget(
                      title: 'Credits applied:',
                      type: PriceStyle.credits,
                      price: state.paymentItemList.creditTotal.toString(),
                    ),
                    const Divider(
                      indent: 0,
                      height: 20,
                      endIndent: 0,
                      color: ZPColors.lightGray2,
                    ),
                    _PriceWidget(
                      title: 'Total:',
                      price:
                          state.paymentSummaryDetails.paymentAmount.toString(),
                      type: PriceStyle.grandTotalPrice,
                    ),
                    const Divider(
                      indent: 0,
                      height: 20,
                      endIndent: 0,
                      color: ZPColors.lightGray2,
                    ),
                  ],
                ),
              );
      },
    );
  }
}

class _PriceWidget extends StatelessWidget {
  const _PriceWidget({
    Key? key,
    required this.title,
    required this.price,
    this.type = PriceStyle.commonPrice,
  }) : super(key: key);
  final String title;
  final String price;
  final PriceStyle type;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        PriceComponent(
          salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
          price: price,
          type: type,
        ),
      ],
    );
  }
}