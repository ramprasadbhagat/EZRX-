part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryApplyButton extends StatelessWidget {
  const _PaymentSummaryApplyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryFilterBloc, PaymentSummaryFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) => Expanded(
        child: ElevatedButton(
          key: WidgetKeys.filterApplyButton,
          onPressed: () {
            context.read<PaymentSummaryFilterBloc>().add(
                  const PaymentSummaryFilterEvent.validateFilters(),
                );
            if (state.filter.isValid) {
              final paymentSummaryBlocState =
                  context.read<PaymentSummaryBloc>().state;
              if (state.filter != paymentSummaryBlocState.appliedFilter) {
                context.read<PaymentSummaryBloc>().add(
                      PaymentSummaryEvent.fetch(
                        appliedFilter: state.filter,
                        searchKey: paymentSummaryBlocState.searchKey,
                      ),
                    );
              }
              context.router.popForced();
            }
          },
          child: Text(
            context.tr('Apply'),
            style: const TextStyle(color: ZPColors.white),
          ),
        ),
      ),
    );
  }
}
