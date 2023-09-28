part of 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';

class _FromOrderDateFilter extends StatelessWidget {
  const _FromOrderDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByOrderFilterBloc, ViewByOrderFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) => Expanded(
        child: TextFormField(
          key: WidgetKeys.viewByOrdersFilterFromDateKey,
          autocorrect: false,
          onTap: () async {
            final viewByOrderFilterBloc = context.read<ViewByOrderFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime(
                DateTime.now().year,
                DateTime.now().month - 6,
                DateTime.now().day,
              ),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.getOrderDateFilterDateRange,
            );
            if (documentDateRange == null) return;
            viewByOrderFilterBloc.add(
              ViewByOrderFilterEvent.setDateRange(
                ViewByOrdersFilter.empty().copyWith(
                  orderDateFrom: DateTimeStringValue(
                    getDateStringByDateTime(documentDateRange.start),
                  ),
                  orderDateTo: DateTimeStringValue(
                    getDateStringByDateTime(documentDateRange.end),
                  ),
                ),
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.orderDateFrom.dateString,
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
