part of 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';

class _ResetButton extends StatelessWidget {
  const _ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () => Navigator.of(context).pop(
          ViewByOrdersFilter.dateRangeEmpty(),
        ),
        child: Text(
          context.tr('Reset'),
          style: const TextStyle(color: ZPColors.primary),
        ),
      ),
    );
  }
}
