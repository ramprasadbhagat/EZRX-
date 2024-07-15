part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';

class _SearchArticle extends StatelessWidget {
  const _SearchArticle();

  @override
  Widget build(BuildContext context) {
    final initialSearchKey = context.read<ArticlesInfoBloc>().state.searchKey;

    return CustomSearchBar(
      key: WidgetKeys.searchSectionTab('Articles'),
      enabled: true,
      initialValue: initialSearchKey.searchValueOrEmpty,
      onSearchChanged: (value) => context.read<ArticlesInfoBloc>().add(
            ArticlesInfoEvent.setSearchKey(
              searchKey: SearchKey.search(value),
            ),
          ),
      onSearchSubmitted: (value) => context.read<ArticlesInfoBloc>().add(
            ArticlesInfoEvent.setSearchKey(
              searchKey: SearchKey.search(value),
            ),
          ),
      customValidator: (value) => SearchKey.search(value).isValid(),
      onClear: () => context.read<ArticlesInfoBloc>().add(
            ArticlesInfoEvent.setSearchKey(
              searchKey: SearchKey.empty(),
            ),
          ),
    );
  }
}
