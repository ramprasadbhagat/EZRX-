part of 'announcement_info_bloc.dart';

@freezed
class AnnouncementInfoState with _$AnnouncementInfoState {
  const AnnouncementInfoState._();

  const factory AnnouncementInfoState({
    required AnnouncementInfo announcementInfo,
    required bool isLoading,
  }) = _AnnouncementInfoState;

  factory AnnouncementInfoState.initial() => AnnouncementInfoState(
        isLoading: false,
        announcementInfo: AnnouncementInfo.empty(),
      );
}
