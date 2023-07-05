// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnnouncementInfoDto _$$_AnnouncementInfoDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AnnouncementInfoDto(
      total: json['total'] as int? ?? 0,
      announcementList: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  AnnouncementItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_AnnouncementInfoDtoToJson(
        _$_AnnouncementInfoDto instance) =>
    <String, dynamic>{
      'total': instance.total,
      'results': instance.announcementList.map((e) => e.toJson()).toList(),
    };

_$_AnnouncementItemDto _$$_AnnouncementItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AnnouncementItemDto(
      id: json['id'] as String? ?? '',
      title: getValue(json, 'title') as String,
      summary: getValue(json, 'summary') as String,
      thumbnail: getSrcValue(json, 'thumbnail') as String,
      publishedDate: getDateValue(json, 'publishedDate') as String,
    );

Map<String, dynamic> _$$_AnnouncementItemDtoToJson(
        _$_AnnouncementItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'thumbnail': instance.thumbnail,
      'publishedDate': instance.publishedDate,
    };
