part of 'package:ezrxmobile/presentation/returns/return_list/return_root/return_root.dart';

class _ListByRequestSearchBar extends StatelessWidget {
  const _ListByRequestSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnListByRequestBloc, ReturnListByRequestState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          current.searchKey.isValueEmpty,
      builder: (context, state) {
        final appliedFilter =
            context.read<ReturnListByRequestBloc>().state.appliedFilter;

        return CustomSearchBar(
          key: WidgetKeys.genericKey(
            key: state.searchKey.searchValueOrEmpty,
          ),
          enabled: !state.isFetching,
          initialValue: state.searchKey.searchValueOrEmpty,
          onSearchChanged: (value) =>
              context.read<ReturnListByRequestBloc>().add(
                    ReturnListByRequestEvent.fetch(
                      appliedFilter: appliedFilter,
                      searchKey: SearchKey.searchFilter(value),
                    ),
                  ),
          onSearchSubmitted: (value) =>
              context.read<ReturnListByRequestBloc>().add(
                    ReturnListByRequestEvent.fetch(
                      appliedFilter: appliedFilter,
                      searchKey: SearchKey.searchFilter(value),
                    ),
                  ),
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          onClear: () => context.read<ReturnListByRequestBloc>().add(
                ReturnListByRequestEvent.fetch(
                  appliedFilter: appliedFilter,
                  searchKey: SearchKey.searchFilter(''),
                ),
              ),
        );
      },
    );
  }
}
