// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_info_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnnouncementInfoDetailsDtoImpl _$$AnnouncementInfoDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnouncementInfoDetailsDtoImpl(
      id: json['id'] as String? ?? '',
      title: readValue(json, 'title') as String? ?? '',
      content: readValue(json, 'content') as String? ?? '',
      summary: json['summary'] as String? ?? '',
      thumbnail: readSrc(json, 'thumbnail') as String? ?? '',
      publishedDate: readIso(json, 'publishedDate') as String? ?? '',
      releaseDate: readIso(json, 'releaseDate') as String,
      manufacturer: readValue(json, 'manufacturer') as String? ?? '',
      source: readValue(json, 'source') as String? ?? '',
      tag: readTag(json, 'tag') as String,
      documentsList: (getDocumentsList(json, 'documents') as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$AnnouncementInfoDetailsDtoImplToJson(
        _$AnnouncementInfoDetailsDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'summary': instance.summary,
      'thumbnail': instance.thumbnail,
      'publishedDate': instance.publishedDate,
      'releaseDate': instance.releaseDate,
      'manufacturer': instance.manufacturer,
      'source': instance.source,
      'tag': instance.tag,
      'documents': instance.documentsList,
    };
