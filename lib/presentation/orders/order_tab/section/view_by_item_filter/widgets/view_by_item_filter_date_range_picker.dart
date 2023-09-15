part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/view_by_item_filter_sheet.dart';

class _ViewByItemFilterDateRangePicker extends StatelessWidget {
  const _ViewByItemFilterDateRangePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<ViewByItemFilterBloc, ViewByItemFilterState>(
          buildWhen: (previous, current) =>
              previous.filter.fromDate != current.filter.fromDate,
          builder: (context, state) => Expanded(
            child: _DateField(
              key: WidgetKeys.viewByItemsFilterFromDateKey,
              displayDate: state.filter.fromDate.dateString,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '-',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        BlocBuilder<ViewByItemFilterBloc, ViewByItemFilterState>(
          buildWhen: (previous, current) =>
              previous.filter.toDate != current.filter.toDate,
          builder: (context, state) => Expanded(
            child: _DateField(
              key: WidgetKeys.viewByItemsFilterToDateKey,
              displayDate: state.filter.toDate.dateString,
            ),
          ),
        ),
      ],
    );
  }
}

class _DateField extends StatelessWidget {
  final String displayDate;

  const _DateField({
    Key? key,
    required this.displayDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: WidgetKeys.toOrderDateField,
      onTap: () async {
        final orderHistoryFilterBloc = context.read<ViewByItemFilterBloc>();
        final orderDateRange = await showDateRangePicker(
          context: context,
          firstDate: DateTime.now().subtract(const Duration(days: 364)),
          lastDate: DateTime.now(),
          initialDateRange: orderHistoryFilterBloc.state.filter.dateRange,
        );
        if (orderDateRange == null) return;
        orderHistoryFilterBloc.add(
          ViewByItemFilterEvent.setOrderDate(
            dateRange: orderDateRange,
          ),
        );
      },
      readOnly: true,
      controller: TextEditingController(text: displayDate),
      decoration: InputDecoration(
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.calendar_month,
            size: 20,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(maxWidth: 25),
        focusedBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
      ),
    );
  }
}
