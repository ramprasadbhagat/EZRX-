part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';

class _ReturnItemsSearchBar extends StatelessWidget {
  const _ReturnItemsSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReturnItemsBloc, ReturnItemsState>(
      buildWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.searchKey != current.searchKey,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.genericKey(
            key: state.searchKey.searchValueOrEmpty,
          ),
          onSearchChanged: (value) {},
          onSearchSubmitted: (value) {
            final customerCodeState = context.read<CustomerCodeBloc>().state;
            context.read<ReturnItemsBloc>().add(
                  ReturnItemsEvent.fetch(
                    appliedFilter: state.appliedFilter,
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCodeInfo: customerCodeState.customerCodeInfo,
                    shipToInfo: customerCodeState.shipToInfo,
                    searchKey: SearchKey.search(value),
                  ),
                );
          },
          customValidator: (value) => SearchKey.search(value).isValid(),
          enabled: !state.isLoading,
          onClear: () {
            final customerCodeState = context.read<CustomerCodeBloc>().state;
            context.read<ReturnItemsBloc>().add(
                  ReturnItemsEvent.fetch(
                    appliedFilter: state.appliedFilter,
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCodeInfo: customerCodeState.customerCodeInfo,
                    shipToInfo: customerCodeState.shipToInfo,
                    searchKey: SearchKey.search(''),
                  ),
                );
          },
          initialValue: state.searchKey.searchValueOrEmpty,
        );
      },
    );
  }
}
