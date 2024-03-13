part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class DeleteCancelAdviceBottomSheet extends StatelessWidget {
  final String paymentAdviceNumber;
  final bool isDelete;
  final bool isInProgress;
  const DeleteCancelAdviceBottomSheet({
    Key? key,
    required this.paymentAdviceNumber,
    required this.isDelete,
    this.isInProgress = false,
  }) : super(key: key);

  factory DeleteCancelAdviceBottomSheet.delete({
    required String paymentAdviceNumber,
    bool isInProgress = false,
    Key? key,
  }) =>
      DeleteCancelAdviceBottomSheet(
        isDelete: true,
        paymentAdviceNumber: paymentAdviceNumber,
        isInProgress: isInProgress,
        key: key,
      );

  factory DeleteCancelAdviceBottomSheet.cancel({
    Key? key,
  }) =>
      DeleteCancelAdviceBottomSheet(
        isDelete: false,
        key: key,
        paymentAdviceNumber: '',
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.deleteCancelAdviceBottomSheet,
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 60,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.tr(
              isDelete ? 'Delete payment advice' : 'Cancel payment advice',
            )}?',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          if (isDelete)
            _DeletePaymentAdviceContent(
              paymentAdviceNumber: paymentAdviceNumber,
              isInProgress: isInProgress,
            )
          else
            Text(
              context.tr(
                'Once cancelled, payment advice cannot be recovered. You will be required to create a new payment advice to complete payment.',
              ),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.extraLightGrey4,
                  ),
            ),
          const SizedBox(
            height: 30,
          ),
          _DeleteCancelAdviceButtons(
            isDelete: isDelete,
          ),
        ],
      ),
    );
  }
}

class _DeletePaymentAdviceContent extends StatelessWidget {
  final bool isInProgress;
  final String paymentAdviceNumber;
  const _DeletePaymentAdviceContent({
    Key? key,
    required this.paymentAdviceNumber,
    this.isInProgress = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isInProgress) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(
              'Payment advice #{adviceNumber} is still in progress.',
              namedArgs: {
                'adviceNumber': paymentAdviceNumber,
              },
            ),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            context.tr(
              'Deletion is not recommended as it may result in duplicate payments for the same invoices.',
            ),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '${context.tr(
              'You may proceed if you are certain that your payment has not been processed.',
            )} ${context.tr(
              'Once deleted, payment advice cannot be recovered. You will be required to create a new payment advice to complete payment.',
            )}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
        ],
      );
    }

    return Text(
      context.tr(
        'Once deleted, payment advice cannot be recovered. You will be required to create a new payment advice to complete payment.',
      ),
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: ZPColors.extraLightGrey4,
          ),
    );
  }
}

class _DeleteCancelAdviceButtons extends StatelessWidget {
  const _DeleteCancelAdviceButtons({
    Key? key,
    required this.isDelete,
  }) : super(key: key);
  final bool isDelete;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      listenWhen: (previous, current) =>
          (previous.isDeletingPayment != current.isDeletingPayment &&
              !current.isDeletingPayment) ||
          (previous.isCancelingAdvice != current.isCancelingAdvice &&
              !current.isCancelingAdvice),
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            context.read<PaymentSummaryBloc>().add(
                  PaymentSummaryEvent.fetch(
                    appliedFilter: PaymentSummaryFilter.empty(),
                    searchKey: SearchKey.searchFilter(''),
                  ),
                );

            if (isDelete) {
              final containPaymentSummaryPage = context.router.stack.any(
                (element) => element.name == PaymentSummaryPageRoute.name,
              );

              if (containPaymentSummaryPage) {
                context.router
                    .popUntilRouteWithName(PaymentSummaryPageRoute.name);
              } else {
                context.router.pushAndPopUntil(
                  const PaymentSummaryPageRoute(),
                  predicate: (Route route) =>
                      route.settings.name == PaymentPageRoute.name,
                );
              }

              CustomSnackBar(
                messageText: context.tr(state.adviceDeletedMessage),
              ).show(context);
            }
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isDeletingPayment != current.isDeletingPayment,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed:
                    state.isDeletingPayment ? null : () => context.router.pop(),
                child: LoadingShimmer.withChild(
                  enabled: state.isDeletingPayment || state.isCancelingAdvice,
                  child: Text(
                    context.tr('Cancel'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                key: WidgetKeys.deleteCancelAdviceBottomSheetButton,
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      backgroundColor: const MaterialStatePropertyAll(
                        ZPColors.red,
                      ),
                    ),
                onPressed: () {
                  if (isDelete && !state.isDeletingPayment) {
                    context.read<PaymentSummaryDetailsBloc>().add(
                          const PaymentSummaryDetailsEvent.deleteAdvice(),
                        );
                  } else if (!isDelete && !state.isCancelingAdvice) {
                    context.read<PaymentSummaryDetailsBloc>().add(
                          const PaymentSummaryDetailsEvent.cancelAdvice(),
                        );
                    context.router.pop();
                  }
                },
                child: LoadingShimmer.withChild(
                  enabled: state.isDeletingPayment || state.isCancelingAdvice,
                  child: Text(
                    context.tr(
                      isDelete ? 'Delete' : 'Confirm',
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
