part of 'announcement_info_bloc.dart';

@freezed
class AnnouncementInfoEvent with _$AnnouncementInfoEvent {
  const factory AnnouncementInfoEvent.getAnnouncement({
    required SalesOrg salesOrg,
    required int pageSize,
  }) = _GetAnnouncementInfo;
}
