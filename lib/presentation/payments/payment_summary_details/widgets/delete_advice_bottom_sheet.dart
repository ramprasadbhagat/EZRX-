part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class DeleteAdviceBottomSheet extends StatelessWidget {
  final String paymentAdviceNumber;
  const DeleteAdviceBottomSheet({
    Key? key,
    required this.paymentAdviceNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.deleteAdviceBottomSheet,
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
            '${context.tr('Delete payment advice')}?',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
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
            context.tr(
              'You may proceed if you are certain that your payment has not been processed. Once deleted, payment advice cannot be recovered. You will be required to create a new payment advice to complete payment.',
            ),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          const SizedBox(
            height: 30,
          ),
          const _DeleteAdviceButtons(),
        ],
      ),
    );
  }
}

class _DeleteAdviceButtons extends StatelessWidget {
  const _DeleteAdviceButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      listenWhen: (previous, current) =>
          previous.isDeletingPayment != current.isDeletingPayment,
      listener: (context, state) {
        if (!state.isDeletingPayment) {
          state.failureOrSuccessOption.fold(
            () {
              context.read<PaymentSummaryBloc>().add(
                    PaymentSummaryEvent.fetch(
                      appliedFilter: PaymentSummaryFilter.empty(),
                      searchKey: SearchKey.searchFilter(''),
                    ),
                  );
              context.router
                  .popUntilRouteWithName(PaymentSummaryPageRoute.name);
              CustomSnackBar(
                messageText: state.adviceDeletedMessage,
              ).show(context);
            },
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        }
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
                  enabled: state.isDeletingPayment,
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
                key: WidgetKeys.deleteAdviceBottomSheetDeleteButton,
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      backgroundColor: const MaterialStatePropertyAll(
                        ZPColors.red,
                      ),
                    ),
                onPressed: state.isDeletingPayment
                    ? null
                    : () => context.read<PaymentSummaryDetailsBloc>().add(
                          const PaymentSummaryDetailsEvent.deleteAdvice(),
                        ),
                child: LoadingShimmer.withChild(
                  enabled: state.isDeletingPayment,
                  child: Text(
                    context.tr('Delete'),
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
