import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';

part 'announcement_article_info_dto.freezed.dart';
part 'announcement_article_info_dto.g.dart';

@freezed
class AnnouncementArticleInfoDto with _$AnnouncementArticleInfoDto {
  const AnnouncementArticleInfoDto._();

  const factory AnnouncementArticleInfoDto({
    @JsonKey(name: 'pageInfo', defaultValue: '', readValue: getEndCursorValue)
        required String endCursor,
    @JsonKey(name: 'total', defaultValue: 0) required int total,
    @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
        required List<AnnouncementArticleItemDto> announcementList,
  }) = _AnnouncementArticleInfoDto;

  AnnouncementArticleInfo get toDomain => AnnouncementArticleInfo(
        total: total,
        endCursor: endCursor,
        announcementList: announcementList.map((e) => e.toDomain).toList(),
      );

  factory AnnouncementArticleInfoDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementArticleInfoDtoFromJson(json);
}

@freezed
class AnnouncementArticleItemDto with _$AnnouncementArticleItemDto {
  const AnnouncementArticleItemDto._();

  const factory AnnouncementArticleItemDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'title', readValue: getValue) required String title,
    @JsonKey(name: 'summary', readValue: getValue) required String summary,
    @JsonKey(name: 'thumbnail', readValue: getSrcValue)
        required String thumbnail,
    @JsonKey(name: 'content', readValue: getContent) required String content,
    @JsonKey(name: 'publishedDate', readValue: getDateValue)
        required String publishedDate,
  }) = _AnnouncementArticleItemDto;

  factory AnnouncementArticleItemDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementArticleItemDtoFromJson(json);

  AnnouncementArticleItem get toDomain => AnnouncementArticleItem(
        id: id,
        title: title,
        content: HtmlContent(content),
        summary: summary,
        thumbnail: thumbnail,
        publishedDate: DateTimeStringValue(publishedDate),
      );
}

String getValue(Map json, String key) =>
    json[key] != null ? json[key]['value'] ?? '' : '';

String getSrcValue(Map json, String key) =>
    json[key] != null ? json[key]['src'] ?? '' : '';

String getContent(Map json, String key) => json[key]?['value'] ?? '';

String getDateValue(Map json, String key) =>
    json[key] != null ? json[key]['isoValue'] ?? '' : '';

String getEndCursorValue(Map json, String key) => json[key]?['endCursor'] ?? '';
