part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';

class _ReturnItemsSearchBar extends StatelessWidget {
  const _ReturnItemsSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ReturnItemsBloc, ReturnItemsState>(
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
        builder: (context, state) => CustomSearchBar(
          key: WidgetKeys.genericKey(key: state.searchKey.searchValueOrEmpty),
          initialValue: state.searchKey.searchValueOrEmpty,
          enabled: !state.isLoading,
          onSearchChanged: (value) => _search(
            context: context,
            searchKey: value,
          ),
          onSearchSubmitted: (value) => _search(
            context: context,
            searchKey: value,
          ),
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          onClear: () => _search(
            context: context,
            searchKey: '',
            onClear: true,
          ),
        ),
      );

  void _search({
    required BuildContext context,
    required String searchKey,
    bool onClear = false,
  }) {
    if (!onClear && searchKey.isEmpty) return;
    context.read<ReturnItemsBloc>().add(
          ReturnItemsEvent.fetch(
            appliedFilter: context.read<ReturnItemsBloc>().state.appliedFilter,
            searchKey: SearchKey.searchFilter(searchKey),
          ),
        );
  }
}
