import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info.dart';

part 'announcement_info_dto.freezed.dart';
part 'announcement_info_dto.g.dart';

@freezed
class AnnouncementInfoDto with _$AnnouncementInfoDto {
  const AnnouncementInfoDto._();

  const factory AnnouncementInfoDto({
    @JsonKey(name: 'total', defaultValue: 0) required int total,
    @JsonKey(name: 'results', defaultValue: <AnnouncementItemDto>[])
        required List<AnnouncementItemDto> announcementList,
  }) = _AnnouncementInfoDto;

  AnnouncementInfo get toDomain => AnnouncementInfo(
        total: total,
        announcementList: announcementList.map((e) => e.toDomain).toList(),
      );

  factory AnnouncementInfoDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementInfoDtoFromJson(json);
}

@freezed
class AnnouncementItemDto with _$AnnouncementItemDto {
  const AnnouncementItemDto._();

  const factory AnnouncementItemDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'title', readValue: getValue) required String title,
    @JsonKey(name: 'summary', readValue: getValue) required String summary,
    @JsonKey(name: 'thumbnail', readValue: getSrcValue)
        required String thumbnail,
    @JsonKey(name: 'publishedDate', readValue: getDateValue)
        required String publishedDate,
  }) = _AnnouncementItemDto;

  factory AnnouncementItemDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementItemDtoFromJson(json);

  AnnouncementItem get toDomain => AnnouncementItem(
      id: id,
      title: title,
      summary: summary,
      thumbnail: thumbnail,
      publishedDate: DateTimeStringValue(publishedDate),);
}

String getValue(Map json, String key) => json[key] != null ?
  json[key]['value'] ?? '' : '';

String getSrcValue(Map json, String key) => json[key] != null ?
  json[key]['src'] ?? '' : '';

String getDateValue(Map json, String key) => json[key] != null ?
  json[key]['isoValue'] ?? '' : '';
