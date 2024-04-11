part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryResetButton extends StatelessWidget {
  const _PaymentSummaryResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          final bloc = context.paymentSummaryBloc(context.isMPPayment);
          if (bloc.state.appliedFilter !=
                  PaymentSummaryFilter.defaultFilter() ||
              bloc.state.searchKey != SearchKey.searchFilter('')) {
            bloc.add(
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
  }
}
