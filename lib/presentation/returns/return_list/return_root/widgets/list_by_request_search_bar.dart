part of '../return_root.dart';

class _ListByRequestSearchBar extends StatelessWidget {
  const _ListByRequestSearchBar({
    Key? key,
  }) : super(key: key);

  void _search({
    required BuildContext context,
    required String searchKey,
    bool onClear = false,
  }) {
    if (!onClear && searchKey.isEmpty) return;
    context.read<ReturnListByRequestBloc>().add(
          ReturnListByRequestEvent.fetch(
            salesOrg: context.read<SalesOrgBloc>().state.salesOrg,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            shipInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
            user: context.read<UserBloc>().state.user,
            appliedFilter:
                context.read<ReturnListByRequestBloc>().state.appliedFilter,
            searchKey: SearchKey.searchFilter(searchKey),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnListByRequestBloc, ReturnListByRequestState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          current.searchKey.isValueEmpty,
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.genericKey(
            key: state.searchKey.searchValueOrEmpty,
          ),
          enabled: !state.isFetching,
          initialValue: state.searchKey.searchValueOrEmpty,
          onSearchChanged: (value) => context
              .read<ReturnListByRequestBloc>()
              .add(
                ReturnListByRequestEvent.autoSearchProduct(
                  salesOrg: context.read<SalesOrgBloc>().state.salesOrg,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  shipInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
                  user: context.read<UserBloc>().state.user,
                  appliedFilter: context
                      .read<ReturnListByRequestBloc>()
                      .state
                      .appliedFilter,
                  searchKey: SearchKey.searchFilter(value),
                ),
              ),
          onSearchSubmitted: (value) => _search(
            context: context,
            searchKey: value,
          ),
          clearIconKey: WidgetKeys.clearIconKey,
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          onClear: () => _search(
            context: context,
            searchKey: '',
            onClear: true,
          ),
        );
      },
    );
  }
}
