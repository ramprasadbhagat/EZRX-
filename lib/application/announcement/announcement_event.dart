part of 'announcement_bloc.dart';

@freezed
class AnnouncementEvent with _$AnnouncementEvent {
  const factory AnnouncementEvent.getAnnouncement() = _GetAnnouncement;

  const factory AnnouncementEvent.close() = _Close;
}
