// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_article_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnnouncementArticleInfoDto _$$_AnnouncementArticleInfoDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AnnouncementArticleInfoDto(
      endCursor: getEndCursorValue(json, 'pageInfo') as String? ?? '',
      total: json['total'] as int? ?? 0,
      announcementList: (json['results'] as List<dynamic>?)
              ?.map((e) => AnnouncementArticleItemDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_AnnouncementArticleInfoDtoToJson(
        _$_AnnouncementArticleInfoDto instance) =>
    <String, dynamic>{
      'pageInfo': instance.endCursor,
      'total': instance.total,
      'results': instance.announcementList.map((e) => e.toJson()).toList(),
    };

_$_AnnouncementArticleItemDto _$$_AnnouncementArticleItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AnnouncementArticleItemDto(
      id: json['id'] as String? ?? '',
      title: getValue(json, 'title') as String,
      summary: getValue(json, 'summary') as String,
      thumbnail: getSrcValue(json, 'thumbnail') as String,
      content: getContent(json, 'content') as String,
      publishedDate: getDateValue(json, 'publishedDate') as String,
      branchInfo: (getBranchNames(json, 'branch') as List<dynamic>)
          .map((e) => BranchAndIc4InfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      iC4Info: (getIC4Names(json, 'iC4') as List<dynamic>)
          .map((e) => BranchAndIc4InfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AnnouncementArticleItemDtoToJson(
        _$_AnnouncementArticleItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'thumbnail': instance.thumbnail,
      'content': instance.content,
      'publishedDate': instance.publishedDate,
      'branch': instance.branchInfo.map((e) => e.toJson()).toList(),
      'iC4': instance.iC4Info.map((e) => e.toJson()).toList(),
    };

_$_BranchAndIc4Dto _$$_BranchAndIc4DtoFromJson(Map<String, dynamic> json) =>
    _$_BranchAndIc4Dto(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
    );

Map<String, dynamic> _$$_BranchAndIc4DtoToJson(_$_BranchAndIc4Dto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
    };
