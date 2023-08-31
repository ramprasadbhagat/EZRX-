part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_filter_bottom_sheet.dart';

class _ResetButton extends StatelessWidget {
  const _ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnItemsFilterBloc, ReturnItemsFilterState>(
      builder: (context, state) {
        return Expanded(
          child: OutlinedButton(
            key: WidgetKeys.filterResetButton,
            onPressed: () {
              if (context.read<ReturnItemsFilterBloc>().state.filter !=
                  ReturnItemsFilter.empty()) {
                final customerCodeState =
                    context.read<CustomerCodeBloc>().state;
                context.read<ReturnItemsBloc>().add(
                      ReturnItemsEvent.fetch(
                        appliedFilter: ReturnItemsFilter.empty(),
                        salesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        customerCodeInfo: customerCodeState.customerCodeInfo,
                        shipToInfo: customerCodeState.shipToInfo,
                      ),
                    );
              }
              context.router.popForced();
            },
            child: Text(
              'Reset'.tr(),
              style: const TextStyle(color: ZPColors.primary),
            ),
          ),
        );
      },
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        key: WidgetKeys.filterApplyButton,
        onPressed: () {
          final filterBloc = context.read<ReturnItemsFilterBloc>();
          if (filterBloc.state.filter !=
              context.read<ReturnItemsBloc>().state.appliedFilter) {
            final customerCodeState = context.read<CustomerCodeBloc>().state;
            context.read<ReturnItemsBloc>().add(
                  ReturnItemsEvent.fetch(
                    appliedFilter: filterBloc.state.filter,
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCodeInfo: customerCodeState.customerCodeInfo,
                    shipToInfo: customerCodeState.shipToInfo,
                  ),
                );
          }
          context.router.popForced();
        },
        child: Text(
          'Apply'.tr(),
          style: const TextStyle(color: ZPColors.white),
        ),
      ),
    );
  }
}
