part of 'package:ezrxmobile/presentation/faq/faq.dart';

class _FAQSearchBar extends StatelessWidget {
  const _FAQSearchBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqBloc, FaqState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching &&
          previous.searchKey != current.searchKey,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomSearchBar(
            key: WidgetKeys.genericKey(key: state.searchKey.searchValueOrEmpty),
            initialValue: state.searchKey.searchValueOrEmpty,
            enabled: !state.isFetching,
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
      },
    );
  }
}
