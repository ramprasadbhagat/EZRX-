part of  'package:ezrxmobile/presentation/returns/return_list/return_by_item_filter/return_by_item_filter_page.dart';

class _ResetButton extends StatelessWidget {
  const _ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          context.read<ViewByItemReturnFilterBloc>().add(
                const ViewByItemReturnFilterEvent.resetFilters(),
              );
          Navigator.of(context).pop(
            ReturnFilter.empty(),
          );
        },
        child: Text(
          context.tr('Reset'),
          style: const TextStyle(color: ZPColors.primary),
        ),
      ),
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) {
        final lastAppliedFilter =
            context.read<ReturnListByItemBloc>().state.appliedFilter;
        final currentFilter = state.filter;
        final isEnable = lastAppliedFilter != currentFilter;

        return Expanded(
          child: ElevatedButton(
            key: WidgetKeys.filterApplyButton,
            onPressed: isEnable ? () => _onPressed(context: context) : null,
            child: Text(
              'Apply'.tr(),
              style: const TextStyle(color: ZPColors.white),
            ),
          ),
        );
      },
    );
  }

  void _onPressed({
    required BuildContext context,
  }) {
    final isValid = context
        .read<ViewByItemReturnFilterBloc>()
        .state
        .filter
        .isReturnAmountValueRangeValid;
    isValid
        ? Navigator.of(context).pop(
            context.read<ViewByItemReturnFilterBloc>().state.filter,
          )
        : context.read<ViewByItemReturnFilterBloc>().add(
              const ViewByItemReturnFilterEvent.setValidationFailure(),
            );
  }
}