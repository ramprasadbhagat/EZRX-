part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/view_by_item_filter_sheet.dart';

class _ViewByItemFilterStatusPicker extends StatelessWidget {
  const _ViewByItemFilterStatusPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemFilterBloc, ViewByItemFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.orderStatusList != current.filter.orderStatusList,
      builder: (context, state) => Column(
        children: state.statusList.map(
          (StatusType status) {
            final name = context.tr(status.getOrDefaultValue(''));
            final value = state.filter.orderStatusList.contains(status);

            return CheckboxListTile(
              key: WidgetKeys.viewByItemsFilterStatusKey(name, value),
              contentPadding: EdgeInsets.zero,
              title: Text(
                name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (bool? value) =>
                  context.read<ViewByItemFilterBloc>().add(
                        ViewByItemFilterEvent.setOrderStatus(
                          status: status,
                          value: value ?? false,
                        ),
                      ),
              value: value,
            );
          },
        ).toList(),
      ),
    );
  }
}
