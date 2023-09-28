part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryFromCreatedDateFilter extends StatelessWidget {
  const _PaymentSummaryFromCreatedDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryFilterBloc, PaymentSummaryFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getCreatedDateFilterDateRange !=
          current.filter.getCreatedDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          key: WidgetKeys.fromDocumentDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<PaymentSummaryFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.getCreatedDateFilterDateRange,
            );
            if (documentDateRange == null) return;
            returnApproverFilterBloc.add(
              PaymentSummaryFilterEvent.setCreatedDate(
                documentDateRange,
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.createdDateFrom.dateString,
          ),
          decoration: InputDecoration(
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.calendar_month,
                size: 20,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxWidth: 25),
            focusedBorder:
                Theme.of(context).inputDecorationTheme.disabledBorder,
          ),
        ),
      ),
    );
  }
}

class _PaymentSummaryToCreatedDateFilter extends StatelessWidget {
  const _PaymentSummaryToCreatedDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryFilterBloc, PaymentSummaryFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getCreatedDateFilterDateRange !=
          current.filter.getCreatedDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          key: WidgetKeys.toDocumentDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<PaymentSummaryFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.getCreatedDateFilterDateRange,
            );
            if (documentDateRange == null) return;
            returnApproverFilterBloc.add(
              PaymentSummaryFilterEvent.setCreatedDate(
                documentDateRange,
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.createdDateTo.dateString,
          ),
          decoration: InputDecoration(
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.calendar_month,
                size: 20,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxWidth: 25),
            focusedBorder:
                Theme.of(context).inputDecorationTheme.disabledBorder,
          ),
        ),
      ),
    );
  }
}
