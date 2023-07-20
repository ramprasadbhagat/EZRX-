part of 'announcement_info_bloc.dart';

@freezed
class AnnouncementInfoState with _$AnnouncementInfoState {
  const AnnouncementInfoState._();

  const factory AnnouncementInfoState({
    required AnnouncementArticleInfo announcementInfo,
    required bool isLoading,
  }) = _AnnouncementInfoState;

  factory AnnouncementInfoState.initial() => AnnouncementInfoState(
        isLoading: false,
        announcementInfo: AnnouncementArticleInfo.empty(),
      );
}
