import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_article_info.freezed.dart';

@freezed
class AnnouncementArticleInfo with _$AnnouncementArticleInfo {
  const AnnouncementArticleInfo._();

  const factory AnnouncementArticleInfo({
    required int total,
    required String endCursor,
    required List<AnnouncementArticleItem> announcementList,
  }) = _AnnouncementArticleInfo;

  factory AnnouncementArticleInfo.empty() => const AnnouncementArticleInfo(
        total: 0,
        announcementList: <AnnouncementArticleItem>[],
        endCursor: '',
      );
}

@freezed
class AnnouncementArticleItem with _$AnnouncementArticleItem {
  const AnnouncementArticleItem._();
  const factory AnnouncementArticleItem({
    required String id,
    required String title,
    required String summary,
    required String thumbnail,
    required StringValue content,
    required DateTimeStringValue publishedDate,
  }) = _AnnouncementArticleItem;

  factory AnnouncementArticleItem.empty() => AnnouncementArticleItem(
        id: '',
        title: '',
        summary: '',
        thumbnail: '',
        content: StringValue(''),
        publishedDate: DateTimeStringValue(''),
      );
}
