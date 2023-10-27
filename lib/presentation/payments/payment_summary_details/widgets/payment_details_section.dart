part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _PaymentDetails extends StatelessWidget {
  const _PaymentDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _PaymentDetailsSection(),
        _PaymentInfoSection(),
        Divider(
          indent: 0,
          height: 20,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
      ],
    );
  }
}

class _PaymentDetailsSection extends StatelessWidget {
  const _PaymentDetailsSection({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      buildWhen: (previous, current) =>
          previous.isDetailFetching != current.isDetailFetching,
      builder: (context, state) {
        final paymentSummaryDetails = state.paymentSummaryDetails;

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
                          '${context.read<EligibilityBloc>().state.salesOrg.paymentIdPretext} #${paymentSummaryDetails.zzAdvice.displayDashIfEmpty}',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: ZPColors.white),
                        ),
                  LoadingShimmer.withChild(
                    enabled: state.isDetailFetching,
                    child: StatusLabel(
                      status: StatusType(
                        paymentSummaryDetails.status.stringValue,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  BalanceTextRow(
                    keyText: 'Payment method'.tr(),
                    valueTextLoading: state.isDetailFetching,
                    valueText:
                        paymentSummaryDetails.paymentMethod.displayDashIfEmpty,
                    keyTextStyle:
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ZPColors.white,
                            ),
                    valueTextStyle:
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ZPColors.white,
                            ),
                  ),
                  BalanceTextRow(
                    keyText: 'PA created date'.tr(),
                    valueTextLoading: state.isDetailFetching,
                    valueText: paymentSummaryDetails.createdDate.dateString,
                    keyTextStyle:
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ZPColors.white,
                            ),
                    valueTextStyle:
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ZPColors.white,
                            ),
                  ),
                  BalanceTextRow(
                    keyText: 'Advice expiry'.tr(),
                    valueTextLoading: state.isDetailFetching,
                    valueText: paymentSummaryDetails.adviceExpiryText,
                    keyTextStyle:
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ZPColors.white,
                            ),
                    valueTextStyle:
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: paymentSummaryDetails
                                  .status.getAdviceExpiryTextColorForFailed,
                            ),
                  ),
                  BalanceTextRow(
                    keyText: 'Payment date'.tr(),
                    valueTextLoading: state.isDetailFetching,
                    valueText: paymentSummaryDetails.paymentDate,
                    keyTextStyle:
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ZPColors.white,
                            ),
                    valueTextStyle:
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ZPColors.white,
                            ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PaymentInfoSection extends StatelessWidget {
  const _PaymentInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: Text(
            context.tr('Payment details'),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AddressInfoSection.noAction(),
        ),
      ],
    );
  }
}
