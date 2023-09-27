part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

final _decimalOnlyRegx = RegExp(r'^\d+\.?\d{0,10}');

class _PaymentSummaryAmountValueToFilter extends StatelessWidget {
  const _PaymentSummaryAmountValueToFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryFilterBloc, PaymentSummaryFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueTo != current.filter.amountValueTo,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          key: WidgetKeys.amountValueTo,
          initialValue: state.filter.amountValueTo.apiParameterValue,
          onChanged: (value) => context.read<PaymentSummaryFilterBloc>().add(
                PaymentSummaryFilterEvent.amountValueToChanged(
                  value.isNotEmpty
                      ? StringUtils.formatter.format(double.parse(value))
                      : '',
                ),
              ),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(_decimalOnlyRegx),
          ],
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
          child: TextFormField(
            autocorrect: false,
            key: WidgetKeys.amountValueFrom,
            initialValue: state.filter.amountValueFrom.apiParameterValue,
            onChanged: (value) => context.read<PaymentSummaryFilterBloc>().add(
                  PaymentSummaryFilterEvent.amountValueFromChanged(
                    value.isNotEmpty
                        ? StringUtils.formatter.format(double.parse(value))
                        : '',
                  ),
                ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(_decimalOnlyRegx),
            ],
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
