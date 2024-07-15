part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';

class _SearchAnnouncement extends StatelessWidget {
  const _SearchAnnouncement();

  @override
  Widget build(BuildContext context) {
    final initialSearchKey =
        context.read<AnnouncementInfoBloc>().state.searchKey;

    return CustomSearchBar(
      key: WidgetKeys.searchSectionTab('Announcements'),
      initialValue: initialSearchKey.searchValueOrEmpty,
      enabled: true,
      onSearchChanged: (value) => context.read<AnnouncementInfoBloc>().add(
            AnnouncementInfoEvent.updateSearchKey(
              searchKey: SearchKey.search(value),
            ),
          ),
      onSearchSubmitted: (value) => context.read<AnnouncementInfoBloc>().add(
            AnnouncementInfoEvent.updateSearchKey(
              searchKey: SearchKey.search(value),
            ),
          ),
      customValidator: (value) => SearchKey.search(value).isValid(),
      onClear: () => context.read<AnnouncementInfoBloc>().add(
            AnnouncementInfoEvent.updateSearchKey(
              searchKey: SearchKey.empty(),
            ),
          ),
    );
  }
}
