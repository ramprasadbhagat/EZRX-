part of 'package:ezrxmobile/presentation/faq/faq.dart';

class _FAQSearchBar extends StatelessWidget {
  const _FAQSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqBloc, FaqState>(
      buildWhen: (previous, current) =>
          previous.getSearchedFaqList != current.getSearchedFaqList &&
          previous.searchKey != current.searchKey,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: CustomSearchBar(
            key: WidgetKeys.genericKey(key: state.searchKey.searchValueOrEmpty),
            initialValue: state.searchKey.searchValueOrEmpty,
            enabled: !state.isFetching,
            onSearchSubmitted: (value) => context.read<FaqBloc>().add(
                  FaqEvent.updatedSearchFaq(searchKey: value),
                ),
            customValidator: (value) => SearchKey.searchFilter(value).isValid(),
            onClear: () => context.read<FaqBloc>().add(
                  const FaqEvent.updatedSearchFaq(searchKey: ''),
                ),
          ),
        );
      },
    );
  }
}
