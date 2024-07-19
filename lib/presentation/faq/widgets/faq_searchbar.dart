part of 'package:ezrxmobile/presentation/faq/faq.dart';

class _FAQSearchBar extends StatelessWidget {
  const _FAQSearchBar();

  @override
  Widget build(BuildContext context) {
    final initialSearchKey = context.read<FaqBloc>().state.searchKey;

    return Padding(
      padding: const EdgeInsets.all(padding12),
      child: CustomSearchBar(
        key: WidgetKeys.genericKey(key: initialSearchKey.searchValueOrEmpty),
        initialValue: initialSearchKey.searchValueOrEmpty,
        enabled: true,
        onSearchChanged: (value) => context.read<FaqBloc>().add(
              FaqEvent.updateSearchKey(searchKey: SearchKey.search(value)),
            ),
        onSearchSubmitted: (value) => context.read<FaqBloc>().add(
              FaqEvent.updateSearchKey(searchKey: SearchKey.search(value)),
            ),
        customValidator: (value) => SearchKey.search(value).isValid(),
        onClear: () => context.read<FaqBloc>().add(
              FaqEvent.updateSearchKey(searchKey: SearchKey.empty()),
            ),
      ),
    );
  }
}
