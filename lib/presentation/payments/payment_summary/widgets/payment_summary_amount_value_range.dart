part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryAmountValueToFilter extends StatelessWidget {
  const _PaymentSummaryAmountValueToFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryFilterBloc, PaymentSummaryFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueTo != current.filter.amountValueTo,
      builder: (context, state) => Expanded(
        child: CustomNumericTextField.decimalNumber(
          autoCorrect: false,
          fieldKey: WidgetKeys.amountValueTo,
          initValue: state.filter.amountValueTo.apiParameterValue,
          onChanged: (value) => context.read<PaymentSummaryFilterBloc>().add(
                PaymentSummaryFilterEvent.amountValueToChanged(
                  value,
                ),
              ),
          decoration: InputDecoration(
            labelText: context.tr('Amount to'),
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
        ),
      ),
    );
  }
}

class _PaymentSummaryAmountValueFromFilter extends StatelessWidget {
  const _PaymentSummaryAmountValueFromFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryFilterBloc, PaymentSummaryFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueFrom != current.filter.amountValueFrom,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: CustomNumericTextField.decimalNumber(
            autoCorrect: false,
            fieldKey: WidgetKeys.amountValueFrom,
            initValue: state.filter.amountValueFrom.apiParameterValue,
            onChanged: (value) => context.read<PaymentSummaryFilterBloc>().add(
                  PaymentSummaryFilterEvent.amountValueFromChanged(
                    value,
                  ),
                ),
            decoration: InputDecoration(
              hintText: context.tr('Amount from'),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
            ),
          ),
        );
      },
    );
  }
}
