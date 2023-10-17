part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryStatusesSelector extends StatelessWidget {
  const _PaymentSummaryStatusesSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryFilterBloc, PaymentSummaryFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.filterStatuses != current.filter.filterStatuses,
      builder: (
        context,
        state,
      ) {
        return Column(
          children: state.statuses.map((StatusType status) {
            final name = status.getValue();
            final value = state.filter.filterStatuses.contains(status);

            return CheckboxListTile(
              key: WidgetKeys.paymentSummaryFilterStatus(name, value),
              contentPadding: EdgeInsets.zero,
              title: Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              onChanged: (bool? value) {
                context.read<PaymentSummaryFilterBloc>().add(
                      PaymentSummaryFilterEvent.statusChanged(
                        status,
                        value ?? false,
                      ),
                    );
              },
              value: value,
            );
          }).toList(),
        );
      },
    );
  }
}
