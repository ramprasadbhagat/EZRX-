part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _PaymentBasicInfoSection extends StatelessWidget {
  const _PaymentBasicInfoSection({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      buildWhen: (previous, current) =>
          previous.isDetailFetching != current.isDetailFetching,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          color: ZPColors.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  state.isDetailFetching
                      ? SizedBox(width: 150, child: LoadingShimmer.tile())
                      : Text(
                          '${context.read<EligibilityBloc>().state.salesOrg.paymentIdPretext} #${state.details.zzAdvice.displayZerosIfEmpty}',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: ZPColors.white),
                        ),
                  LoadingShimmer.withChild(
                    enabled: state.isDetailFetching,
                    child: StatusLabel(
                      status: StatusType(
                        state.details.status.displayStatusText,
                      ),
                    ),
                  ),
                ],
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: context.tr('Payment method'),
                valueTextLoading: state.isDetailFetching,
                valueText: state.details.paymentMethod.getOrDefaultValue(''),
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: context.tr('PA created date'),
                valueTextLoading: state.isDetailFetching,
                valueText: state.details.createdDate.dateString,
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: context.tr('Advice expiry'),
                valueTextLoading: state.isDetailFetching,
                valueText: state.adviceExpiryText,
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: state
                          .details.status.getAdviceExpiryTextColorForFailed,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: context.tr('Payment date'),
                valueTextLoading: state.isDetailFetching,
                valueText: state.details.paymentDate,
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
