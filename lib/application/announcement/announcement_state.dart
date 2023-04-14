part of 'announcement_bloc.dart';

@freezed
class AnnouncementState with _$AnnouncementState {
  const AnnouncementState._();

  const factory AnnouncementState({
    required Announcement announcement,
    required bool preferSalesOrgLanguage,
    required bool isLoading,
    required bool isClosed,
  }) = _AnnouncementState;

  factory AnnouncementState.initial() => AnnouncementState(
        isClosed: true,
        isLoading: false,
        preferSalesOrgLanguage: true,
        announcement: Announcement.empty(),
      );
}
