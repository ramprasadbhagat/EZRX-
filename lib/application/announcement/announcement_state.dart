part of 'announcement_bloc.dart';

@freezed
class AnnouncementState with _$AnnouncementState {
  const AnnouncementState._();

  const factory AnnouncementState({
    required Announcement announcement,
    required bool isLoading,
    required bool isClosed,
  }) = _AnnouncementState;

  factory AnnouncementState.initial() => AnnouncementState(
        isClosed: false,
        isLoading: false,
        announcement: Announcement.empty(),
      );

  bool get hasValidAnnouncement => announcement.hasValidAnnouncement;
  String get descriptionDisplay => announcement.descriptionDisplay;
}
