part of 'announcement_info_bloc.dart';

@freezed
class AnnouncementInfoEvent with _$AnnouncementInfoEvent {
  const factory AnnouncementInfoEvent.fetch({
    required SalesOrg salesOrg,
  }) = _Fetch;
  const factory AnnouncementInfoEvent.loadMore({
    required SalesOrg salesOrg,
  }) = _LoadMore;
  const factory AnnouncementInfoEvent.updateSearchKey({
    required String searchKey,
  }) = _UpdateSearchKey;
}
