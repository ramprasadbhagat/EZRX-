part of 'announcement_info_bloc.dart';

@freezed
class AnnouncementInfoState with _$AnnouncementInfoState {
  const AnnouncementInfoState._();

  const factory AnnouncementInfoState({
    required AnnouncementArticleInfo announcementInfo,
    required bool isLoading,
    required bool canLoadMore,
    required SearchKey searchKey,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _AnnouncementInfoState;

  factory AnnouncementInfoState.initial() => AnnouncementInfoState(
        isLoading: false,
        canLoadMore: true,
        searchKey: SearchKey.searchFilter(''),
        announcementInfo: AnnouncementArticleInfo.empty(),
        apiFailureOrSuccessOption: none(),
      );

  List<AnnouncementArticleItem> get searchedAnnouncementList =>
      announcementInfo.announcementList
          .where(
            (element) => element.title
                .toLowerCase()
                .contains(searchKey.searchValueOrEmpty.toLowerCase()),
          )
          .toList();
}
