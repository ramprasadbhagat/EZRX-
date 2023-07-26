part of 'announcement_info_bloc.dart';

@freezed
class AnnouncementInfoState with _$AnnouncementInfoState {
  const AnnouncementInfoState._();

  const factory AnnouncementInfoState({
    required AnnouncementArticleInfo announcementInfo,
    required bool isLoading,
    required bool canLoadMore,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _AnnouncementInfoState;

  factory AnnouncementInfoState.initial() => AnnouncementInfoState(
        isLoading: false,
        canLoadMore: true,
        announcementInfo: AnnouncementArticleInfo.empty(),
        apiFailureOrSuccessOption: none(),
      );
}
