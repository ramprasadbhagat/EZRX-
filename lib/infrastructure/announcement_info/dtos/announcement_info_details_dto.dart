import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_info_details_dto.freezed.dart';
part 'announcement_info_details_dto.g.dart';

@freezed
class AnnouncementInfoDetailsDto with _$AnnouncementInfoDetailsDto {
  const AnnouncementInfoDetailsDto._();

  const factory AnnouncementInfoDetailsDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'title', readValue: readValue, defaultValue: '')
        required String title,
    @JsonKey(name: 'content', readValue: readValue, defaultValue: '')
        required String content,
    @JsonKey(name: 'summary', defaultValue: '') required String summary,
    @JsonKey(name: 'thumbnail', readValue: readSrc, defaultValue: '')
        required String thumbnail,
    @JsonKey(name: 'publishedDate', readValue: readIso, defaultValue: '')
        required String publishedDate,
    @JsonKey(name: 'manufacturer', readValue: readValue, defaultValue: '')
        required String manufacturer,
    @JsonKey(name: 'source', readValue: readValue, defaultValue: '')
        required String source,
    @JsonKey(name: 'tag', readValue: readValue, defaultValue: '')
        required String tag,
  }) = _AnnouncementInfoDetailsDto;

  AnnouncementInfoDetails get toDomain => AnnouncementInfoDetails(
        id: id,
        title: title,
        content: HtmlContent(content),
        summary: summary,
        thumbnail: thumbnail,
        publishedDate: DateTimeStringValue(publishedDate),
        manufacturer: Manufacturer(manufacturer),
        source: Source(source),
        tag: tag,
      );

  factory AnnouncementInfoDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementInfoDetailsDtoFromJson(json);
}

String readValue(Map json, String key) => json[key]['value'] ?? '';
String readSrc(Map json, String key) => json[key]['src'] ?? '';
String readIso(Map json, String key) => json[key]['isoValue'] ?? '';
