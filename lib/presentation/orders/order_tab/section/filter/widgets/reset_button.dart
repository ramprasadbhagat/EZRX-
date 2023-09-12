part of 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';

class _ResetButton extends StatelessWidget {
  const _ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => Navigator.of(context).pop(
          ViewByOrdersFilter.empty(),
        ),
        child: const Text(
          'Reset',
          style: TextStyle(color: ZPColors.primary),
        ).tr(),
      ),
    );
  }
}
