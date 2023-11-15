// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_info_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnnouncementInfoDetailsDto _$$_AnnouncementInfoDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AnnouncementInfoDetailsDto(
      id: json['id'] as String? ?? '',
      title: readValue(json, 'title') as String? ?? '',
      content: readValue(json, 'content') as String? ?? '',
      summary: json['summary'] as String? ?? '',
      thumbnail: readSrc(json, 'thumbnail') as String? ?? '',
      publishedDate: readIso(json, 'publishedDate') as String? ?? '',
      manufacturer: readValue(json, 'manufacturer') as String? ?? '',
      source: readValue(json, 'source') as String? ?? '',
      tag: readTag(json, 'tag') as String,
    );

Map<String, dynamic> _$$_AnnouncementInfoDetailsDtoToJson(
        _$_AnnouncementInfoDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'summary': instance.summary,
      'thumbnail': instance.thumbnail,
      'publishedDate': instance.publishedDate,
      'manufacturer': instance.manufacturer,
      'source': instance.source,
      'tag': instance.tag,
    };
