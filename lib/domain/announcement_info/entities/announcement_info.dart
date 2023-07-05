import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_info.freezed.dart';

@freezed
class AnnouncementInfo with _$AnnouncementInfo {
  const AnnouncementInfo._();

  const factory AnnouncementInfo({
    required int total,
    required List<AnnouncementItem> announcementList,
  }) = _AnnouncementInfo;

  factory AnnouncementInfo.empty() =>
      const AnnouncementInfo(total: 0, announcementList: <AnnouncementItem>[]);
}

@freezed
class AnnouncementItem with _$AnnouncementItem {
  const AnnouncementItem._();
  const factory AnnouncementItem({
    required String id,
    required String title,
    required String summary,
    required String thumbnail,
    required DateTimeStringValue publishedDate,
  }) = _AnnouncementItem;

  factory AnnouncementItem.empty() => AnnouncementItem(
        id: '',
        title: '',
        summary: '',
        thumbnail: '',
        publishedDate: DateTimeStringValue(''),
      );
}
