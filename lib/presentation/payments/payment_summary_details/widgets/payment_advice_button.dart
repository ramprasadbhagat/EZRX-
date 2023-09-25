part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _PaymentAdviceButton extends StatelessWidget {
  const _PaymentAdviceButton({
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
            : Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 2,
                      color: ZPColors.boxShadowGray,
                    ),
                  ],
                  color: ZPColors.white,
                ),
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                  top: 16,
                  bottom: 30,
                ),
                child: Row(
                  key: WidgetKeys.buttonRowKey,
                  children: [
                    if (!state.paymentSummaryDetails.status
                        .getIsSuccessfulOrProcessed)
                      Expanded(
                        child: OutlinedButton(
                          key: WidgetKeys.deleteAdviceButtonKey,
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: ZPColors.red,
                            ),
                          ),
                          child: Text(
                            'Delete advice'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: ZPColors.red),
                          ).tr(),
                          onPressed: () {},
                        ),
                      ),
                    if (!state.paymentSummaryDetails.status
                        .getIsSuccessfulOrProcessed)
                      const SizedBox(
                        width: 16,
                      ),
                    Expanded(
                      child: OutlinedButton(
                        key: WidgetKeys.downloadAdviceButtonKey,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: ZPColors.primary,
                          ),
                        ),
                        child: Text(
                          'Download advice'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: ZPColors.primary),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
