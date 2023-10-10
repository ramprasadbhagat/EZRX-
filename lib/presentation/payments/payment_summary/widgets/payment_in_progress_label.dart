part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentInProgressLabel extends StatelessWidget {
  const _PaymentInProgressLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentInProgressBloc, PaymentInProgressState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 19, right: 19, top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: const BoxDecoration(
            color: ZPColors.mustardColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: PriceComponent(
            price: state.amount.getOrDefaultValue('0'),
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            title: context.tr('In-progress: '),
            priceLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.primary,
                ),
            type: PriceStyle.paymentInProgressPrice,
          ),
        );
      },
    );
  }
}
