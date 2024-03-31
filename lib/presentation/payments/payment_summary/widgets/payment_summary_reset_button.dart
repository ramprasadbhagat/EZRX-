part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryResetButton extends StatelessWidget {
  const _PaymentSummaryResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryBloc, PaymentSummaryState>(
      buildWhen: (previous, current) =>
          previous.appliedFilter != current.appliedFilter ||
          previous.searchKey != current.searchKey,
      builder: (context, state) {
        return Expanded(
          child: OutlinedButton(
            key: WidgetKeys.filterResetButton,
            onPressed: () {
              if (state.appliedFilter != PaymentSummaryFilter.defaultFilter() ||
                  state.searchKey != SearchKey.searchFilter('')) {
                context.read<PaymentSummaryBloc>().add(
                      PaymentSummaryEvent.fetch(
                        appliedFilter: PaymentSummaryFilter.defaultFilter(),
                        searchKey: SearchKey.searchFilter(''),
                      ),
                    );
              }
              context.router.popForced();
            },
            child: Text(
              context.tr('Reset'),
              style: const TextStyle(color: ZPColors.primary),
            ),
          ),
        );
      },
    );
  }
}
