part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';

class _SearchAnnouncement extends StatelessWidget {
  const _SearchAnnouncement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementInfoBloc, AnnouncementInfoState>(
      buildWhen: (previous, current) =>
          previous.searchedAnnouncementList !=
                  current.searchedAnnouncementList &&
              previous.searchKey != current.searchKey ||
          previous.isLoading != current.isLoading,
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.genericKey(key: state.searchKey.searchValueOrEmpty),
          initialValue: state.searchKey.searchValueOrEmpty,
          enabled: !state.isLoading,
          onSearchChanged: (value) => context.read<AnnouncementInfoBloc>().add(
                AnnouncementInfoEvent.updateSearchKey(
                  searchKey: value,
                ),
              ),
          onSearchSubmitted: (value) =>
              context.read<AnnouncementInfoBloc>().add(
                    AnnouncementInfoEvent.updateSearchKey(
                      searchKey: value,
                    ),
                  ),
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          onClear: () => context.read<AnnouncementInfoBloc>().add(
                const AnnouncementInfoEvent.updateSearchKey(searchKey: ''),
              ),
        );
      },
    );
  }
}
