part of 'package:ezrxmobile/presentation/products/filter_by_page/filter_by_page.dart';

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      buildWhen: (previous, current) =>
          previous.displayMaterialFilter != current.displayMaterialFilter,
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.genericKey(key: state.searchKey.searchValueOrEmpty),
          initialValue: state.searchKey.searchValueOrEmpty,
          enabled: !state.isFetching,
          clearIconKey: WidgetKeys.clearSearchFilter,
          onClear: () => context.read<MaterialFilterBloc>().add(
                const MaterialFilterEvent.updateSearchKey(''),
              ),
          onSearchSubmitted: (value) => context.read<MaterialFilterBloc>().add(
                MaterialFilterEvent.updateSearchKey(value),
              ),
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
        );
      },
    );
  }
}
