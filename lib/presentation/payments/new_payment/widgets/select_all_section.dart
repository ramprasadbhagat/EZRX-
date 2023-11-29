part of 'package:ezrxmobile/presentation/payments/new_payment/new_payment_page.dart';

class _CheckAllCreditsWidget extends StatelessWidget {
  final List<CustomerOpenItem> selectedCredits;

  const _CheckAllCreditsWidget({
    Key? key,
    required this.selectedCredits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableCreditsBloc, AvailableCreditsState>(
      buildWhen: (previous, current) => previous.items != current.items,
      builder: (context, state) {
        return _CheckAllWidget(
          value: selectedCredits.isNotEmpty &&
              state.items.isEqual(selectedCredits),
          onChanged: (value) => context.read<NewPaymentBloc>().add(
                NewPaymentEvent.updateAllCredits(
                  items: (value ?? false) ? state.items : <CustomerOpenItem>[],
                ),
              ),
        );
      },
    );
  }
}

class _CheckAllInvoicesWidget extends StatelessWidget {
  final List<CustomerOpenItem> selectedInvoices;

  const _CheckAllInvoicesWidget({
    Key? key,
    required this.selectedInvoices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutstandingInvoicesBloc, OutstandingInvoicesState>(
      buildWhen: (previous, current) => previous.items != current.items,
      builder: (context, state) {
        return _CheckAllWidget(
          value: selectedInvoices.isNotEmpty &&
              state.items.isEqual(selectedInvoices),
          onChanged: (value) => context.read<NewPaymentBloc>().add(
                NewPaymentEvent.updateAllInvoices(
                  items: (value ?? false) ? state.items : <CustomerOpenItem>[],
                ),
              ),
        );
      },
    );
  }
}

class _CheckAllWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _CheckAllWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          key: WidgetKeys.checkAllWidget,
          contentPadding: EdgeInsets.zero,
          title: Text(
            context.tr('All'),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          visualDensity: VisualDensity.compact,
          onChanged: onChanged,
          value: value,
        ),
        const Divider(
          indent: 0,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
      ],
    );
  }
}
