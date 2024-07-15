part of 'package:ezrxmobile/presentation/products/filter_by_page/filter_by_page.dart';

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    final initialSearchKey =
        context.read<MaterialFilterBloc>().state.searchKey.searchValueOrEmpty;

    return CustomSearchBar(
      key: WidgetKeys.genericKey(key: initialSearchKey),
      initialValue: initialSearchKey,
      enabled: true,
      onClear: () => context.read<MaterialFilterBloc>().add(
            const MaterialFilterEvent.updateSearchKey(''),
          ),
      onSearchSubmitted: (value) => context.read<MaterialFilterBloc>().add(
            MaterialFilterEvent.updateSearchKey(value),
          ),
      onSearchChanged: (value) => context.read<MaterialFilterBloc>().add(
            MaterialFilterEvent.updateSearchKey(value),
          ),
      customValidator: (value) => SearchKey.search(value).isValid(),
    );
  }
}
