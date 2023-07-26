part of 'announcement_info_bloc.dart';

@freezed
class AnnouncementInfoEvent with _$AnnouncementInfoEvent {
  const factory AnnouncementInfoEvent.fetch({
    required SalesOrg salesOrg,
  }) = _Fetch;
  const factory AnnouncementInfoEvent.loadMore({
    required SalesOrg salesOrg,
  }) = _LoadMore;
}
