part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/view_by_item_filter_sheet.dart';

class _ViewByItemFilterHistoryTypePicker extends StatelessWidget {
  const _ViewByItemFilterHistoryTypePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemFilterBloc, ViewByItemFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.orderHistoryType != current.filter.orderHistoryType,
      builder: (context, state) => Column(
        children: OrderHistoryType.supportedTypes.map((type) {
          return ListTileTheme(
            horizontalTitleGap: 2,
            child: RadioListTile<OrderHistoryType>(
              contentPadding: EdgeInsets.zero,
              title: Text(
                context.tr(type.title),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (value) {
                if (value == null) return;
                context.read<ViewByItemFilterBloc>().add(
                      ViewByItemFilterEvent.setOrderHistoryType(type: value),
                    );
              },
              groupValue: state.filter.orderHistoryType,
              value: type,
            ),
          );
        }).toList(),
      ),
    );
  }
}
