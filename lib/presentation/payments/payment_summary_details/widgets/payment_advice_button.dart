part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _PaymentAdviceButton extends StatelessWidget {
  const _PaymentAdviceButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      listenWhen: (previous, current) =>
          previous.isSavingAdvice != current.isSavingAdvice,
      listener: (context, state) {
        if (!state.isSavingAdvice) {
          state.failureOrSuccessOption.fold(
            () => CustomSnackBar(
              messageText: 'Download Successful',
            ).show(context),
            (option) => option.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (r) {},
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.isListLoading != current.isListLoading ||
          previous.isDetailFetching != current.isDetailFetching ||
          previous.isSavingAdvice != current.isSavingAdvice ||
          previous.isFetchingAdvice != current.isFetchingAdvice,
      builder: (context, state) {
        return state.isLoading ||
                state.paymentItemList.isEmpty ||
                state.isFetchingAdvice ||
                state.paymentInvoiceInfoPdf.isEmpty
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
                          onPressed: state.isSavingAdvice
                              ? null
                              : () => _showDeleteAdviceBottomSheet(
                                    context,
                                    paymentAdviceNumber: state
                                        .paymentSummaryDetails
                                        .zzAdvice
                                        .displayDashIfEmpty,
                                  ),
                          child: SizedBox(
                            height: 20,
                            child: LoadingShimmer.withChild(
                              enabled: state.isSavingAdvice,
                              child: Text(
                                'Delete advice'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: ZPColors.red),
                              ).tr(),
                            ),
                          ),
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
                        onPressed: state.isSavingAdvice
                            ? null
                            : () => context
                                .read<PaymentSummaryDetailsBloc>()
                                .add(
                                  const PaymentSummaryDetailsEvent.saveAdvice(),
                                ),
                        child: SizedBox(
                          height: 20,
                          child: LoadingShimmer.withChild(
                            enabled: state.isSavingAdvice,
                            child: Text(
                              context.tr('Download advice'),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color: ZPColors.primary,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  void _showDeleteAdviceBottomSheet(
    BuildContext context, {
    required String paymentAdviceNumber,
  }) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => DeleteAdviceBottomSheet(
        paymentAdviceNumber: paymentAdviceNumber,
      ),
    );
  }
}
