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
    @JsonKey(name: 'releaseDate', readValue: getDateValue)
        required String releaseDate,
    @JsonKey(name: 'branch', readValue: getBranchNames)
        required List<BranchAndIc4InfoDto> branchInfo,
    @JsonKey(name: 'iC4', readValue: getIC4Names)
        required List<BranchAndIc4InfoDto> iC4Info,
    @JsonKey(name: 'tag', readValue: readTag) required String tag,
    @JsonKey(name: 'manufacturer', readValue: getValue)
        required String manufacturer,
    @JsonKey(name: 'documents', readValue: getDocumentsList)
        required List<String> documentsList,
    @JsonKey(name: 'pinToTop', readValue: readPinToTop) required bool pinToTop,
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
        branchInfo: branchInfo.map((e) => e.toDomain).toList(),
        iC4Info: iC4Info.map((e) => e.toDomain).toList(),
        tag: tag,
        manufacturer: manufacturer,
        documents: documentsList,
        pinToTop: pinToTop,
        releaseDate: DateTimeStringValue(releaseDate),
      );
}

@freezed
class BranchAndIc4InfoDto with _$BranchAndIc4InfoDto {
  const BranchAndIc4InfoDto._();

  const factory BranchAndIc4InfoDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'displayName', defaultValue: '') required String displayName,
  }) = _BranchAndIc4Dto;

  factory BranchAndIc4InfoDto.fromJson(Map<String, dynamic> json) =>
      _$BranchAndIc4InfoDtoFromJson(json);

  BranchAndIc4Info get toDomain => BranchAndIc4Info(
        id: id,
        displayName: displayName,
        name: name,
      );
}

String getValue(Map json, String key) =>
    json[key] != null ? json[key]['value'] ?? '' : '';

String getSrcValue(Map json, String key) =>
    json[key]?['jsonValue']?['value']?['src'] ?? json[key]?['src'] ?? '';

List<dynamic> getBranchNames(Map json, String key) => json[key]?['value'] ?? [];

List<dynamic> getIC4Names(Map json, String key) => json[key]?['value'] ?? [];

String getContent(Map json, String key) => json[key]?['value'] ?? '';

String getDateValue(Map json, String key) =>
    json[key] != null ? json[key]['isoValue'] ?? '' : '';

String getEndCursorValue(Map json, String key) => json[key]?['endCursor'] ?? '';

String readTag(Map json, String key) => json[key]?['value']?['name'] ?? '';

List<dynamic> getDocumentsList(Map json, String _) {
  final urlList = json['documents']?['jsonValue'] ?? [];

  return urlList.map((e) => e['url'] ?? '').toList();
}

bool readPinToTop(Map json, String key) => json[key]?['boolValue'] ?? false;
