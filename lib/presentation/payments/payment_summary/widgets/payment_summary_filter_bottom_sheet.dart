part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryFilterBottomSheet extends StatelessWidget {
  final bool isMarketPlace;

  const _PaymentSummaryFilterBottomSheet({
    Key? key,
    required this.isMarketPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfig =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: BlocBuilder<PaymentSummaryFilterBloc, PaymentSummaryFilterState>(
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages,
        builder: (context, state) => CustomBottomSheet(
          sheetKey: WidgetKeys.paymentSummaryFilter,
          headerText: 'Filter',
          child: Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    context.tr('Created date'),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Row(
                  children: [
                    const _PaymentSummaryFromCreatedDateFilter(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '-',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const _PaymentSummaryToCreatedDateFilter(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                  child: Text(
                    '${context.tr('Amount range')} (${salesOrgConfig.currency.code})',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _PaymentSummaryAmountValueFromFilter(),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        '-',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const _PaymentSummaryAmountValueToFilter(),
                  ],
                ),
                if (state.showErrorMessages &&
                    !state.filter.isAmountValueRangeValid)
                  ValueRangeError(
                    label: context.tr('Invalid Amount range!'),
                    isValid: state.filter.isAmountValueRangeValid,
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, top: 24.0),
                  child: Text(
                    context.tr('Status'),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                const _PaymentSummaryStatusesSelector(),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  children: [
                    _PaymentSummaryResetButton(),
                    SizedBox(
                      width: 16,
                    ),
                    _PaymentSummaryApplyButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
