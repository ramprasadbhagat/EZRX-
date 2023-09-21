part of 'package:ezrxmobile/presentation/returns/return_list/return_root/return_root.dart';

class _ListByItemSearchBar extends StatelessWidget {
  const _ListByItemSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnListByItemBloc, ReturnListByItemState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          current.searchKey.isValueEmpty,
      builder: (context, state) {
        final appliedFilter =
            context.read<ReturnListByItemBloc>().state.appliedFilter;

        return CustomSearchBar(
          key: WidgetKeys.genericKey(
            key: state.searchKey.searchValueOrEmpty,
          ),
          enabled: !state.isFetching,
          initialValue: state.searchKey.searchValueOrEmpty,
          onSearchChanged: (value) => context.read<ReturnListByItemBloc>().add(
                ReturnListByItemEvent.fetch(
                  appliedFilter: appliedFilter,
                  searchKey: SearchKey.searchFilter(value),
                ),
              ),
          onSearchSubmitted: (value) =>
              context.read<ReturnListByItemBloc>().add(
                    ReturnListByItemEvent.fetch(
                      appliedFilter: appliedFilter,
                      searchKey: SearchKey.searchFilter(value),
                    ),
                  ),
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          onClear: () => context.read<ReturnListByItemBloc>().add(
                ReturnListByItemEvent.fetch(
                  appliedFilter: appliedFilter,
                  searchKey: SearchKey.searchFilter(''),
                ),
              ),
        );
      },
    );
  }
}
