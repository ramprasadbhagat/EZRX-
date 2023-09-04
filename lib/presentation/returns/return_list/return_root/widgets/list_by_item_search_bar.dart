part of '../return_root.dart';

class _ListByItemSearchBar extends StatelessWidget {
  const _ListByItemSearchBar({
    Key? key,
  }) : super(key: key);

  void _search({
    required BuildContext context,
    required String searchKey,
    bool onClear = false,
  }) {
    if (!onClear && searchKey.isEmpty) return;
    context.read<ReturnListByItemBloc>().add(
          ReturnListByItemEvent.fetch(
            appliedFilter:
                context.read<ReturnListByItemBloc>().state.appliedFilter,
            searchKey: SearchKey.searchFilter(searchKey),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnListByItemBloc, ReturnListByItemState>(
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
          onSearchChanged: (value) => context.read<ReturnListByItemBloc>().add(
                ReturnListByItemEvent.autoSearchProduct(
                  appliedFilter:
                      context.read<ReturnListByItemBloc>().state.appliedFilter,
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
