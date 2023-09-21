part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';

class _SearchArticle extends StatelessWidget {
  const _SearchArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesInfoBloc, ArticlesInfoState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.searchKey != current.searchKey,
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.genericKey(
            key: state.searchKey.searchValueOrEmpty,
          ),
          enabled: !state.isFetching,
          initialValue: state.searchKey.searchValueOrEmpty,
          onSearchChanged: (value) {},
          onSearchSubmitted: (value) {
            context.read<ArticlesInfoBloc>().add(
                  ArticlesInfoEvent.setSearchKey(searchKey: value),
                );
          },
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          onClear: () => context.read<ArticlesInfoBloc>().add(
                const ArticlesInfoEvent.setSearchKey(searchKey: ''),
              ),
        );
      },
    );
  }
}
