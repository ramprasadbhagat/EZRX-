part of 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';

class _ApplyButton extends StatelessWidget {
  const _ApplyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pop(
          context.read<ViewByOrderFilterBloc>().state.filter,
        ),
        child: const Text(
          'Apply',
          style: TextStyle(color: ZPColors.white),
        ).tr(),
      ),
    );
  }
}
