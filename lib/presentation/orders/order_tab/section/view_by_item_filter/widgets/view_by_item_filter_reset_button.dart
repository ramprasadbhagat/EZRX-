part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/view_by_item_filter_sheet.dart';

class _ViewByItemFilterResetButton extends StatelessWidget {
  const _ViewByItemFilterResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: WidgetKeys.filterResetButton,
      onPressed: () {
        context.read<ViewByItemFilterBloc>().add(
              const ViewByItemFilterEvent.initializeOrReset(),
            );
        Navigator.of(context).pop(
          context.read<ViewByItemFilterBloc>().state.emptyViewByItemFilter,
        );
      },
      child: Text(
        'Reset'.tr(),
        style: const TextStyle(color: ZPColors.primary),
      ),
    );
  }
}
