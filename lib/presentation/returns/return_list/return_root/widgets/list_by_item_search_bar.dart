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
      builder: (context, state) => CustomSearchBar(
        key: WidgetKeys.genericKey(
          key: state.searchKey.searchValueOrEmpty,
        ),
        enabled: !state.isFetching,
        initialValue: state.searchKey.searchValueOrEmpty,
        onSearchChanged: (value) => _search(
          keyword: value,
          context: context,
        ),
        onSearchSubmitted: (value) => _search(
          keyword: value,
          context: context,
        ),
        customValidator: (value) => SearchKey.searchFilter(value).isValid(),
        onClear: () => _search(
          keyword: '',
          context: context,
        ),
      ),
    );
  }

  void _search({required String keyword, required BuildContext context}) {
    final bloc = context.read<ReturnListByItemBloc>();
    final appliedFilter = bloc.state.appliedFilter;
    trackMixpanelEvent(
      TrackingEvents.returnRequestSearched,
      props: {
        TrackingProps.keyword: keyword,
        TrackingProps.subTabFrom: const ReturnByItemPageRoute().path,
      },
    );
    bloc.add(
      ReturnListByItemEvent.fetch(
        appliedFilter: appliedFilter,
        searchKey: SearchKey.searchFilter(keyword),
      ),
    );
  }
}
