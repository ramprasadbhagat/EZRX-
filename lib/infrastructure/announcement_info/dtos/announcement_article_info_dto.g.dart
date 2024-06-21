// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_article_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnnouncementArticleInfoDtoImpl _$$AnnouncementArticleInfoDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnouncementArticleInfoDtoImpl(
      endCursor: getEndCursorValue(json, 'pageInfo') as String? ?? '',
      total: (json['total'] as num?)?.toInt() ?? 0,
      announcementList: (json['results'] as List<dynamic>?)
              ?.map((e) => AnnouncementArticleItemDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$AnnouncementArticleInfoDtoImplToJson(
        _$AnnouncementArticleInfoDtoImpl instance) =>
    <String, dynamic>{
      'pageInfo': instance.endCursor,
      'total': instance.total,
      'results': instance.announcementList.map((e) => e.toJson()).toList(),
    };

_$AnnouncementArticleItemDtoImpl _$$AnnouncementArticleItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnouncementArticleItemDtoImpl(
      id: json['id'] as String? ?? '',
      title: getValue(json, 'title') as String,
      summary: getValue(json, 'summary') as String,
      thumbnail: getSrcValue(json, 'thumbnail') as String,
      content: getContent(json, 'content') as String,
      publishedDate: getDateValue(json, 'publishedDate') as String,
      releaseDate: getDateValue(json, 'releaseDate') as String,
      branchInfo: (getBranchNames(json, 'branch') as List<dynamic>)
          .map((e) => BranchAndIc4InfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      iC4Info: (getIC4Names(json, 'iC4') as List<dynamic>)
          .map((e) => BranchAndIc4InfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      tag: readTag(json, 'tag') as String,
      manufacturer: getValue(json, 'manufacturer') as String,
      documentsList: (getDocumentsList(json, 'documents') as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      pinToTop: readPinToTop(json, 'pinToTop') as bool,
    );

Map<String, dynamic> _$$AnnouncementArticleItemDtoImplToJson(
        _$AnnouncementArticleItemDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'thumbnail': instance.thumbnail,
      'content': instance.content,
      'publishedDate': instance.publishedDate,
      'releaseDate': instance.releaseDate,
      'branch': instance.branchInfo.map((e) => e.toJson()).toList(),
      'iC4': instance.iC4Info.map((e) => e.toJson()).toList(),
      'tag': instance.tag,
      'manufacturer': instance.manufacturer,
      'documents': instance.documentsList,
      'pinToTop': instance.pinToTop,
    };

_$BranchAndIc4DtoImpl _$$BranchAndIc4DtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BranchAndIc4DtoImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
    );

Map<String, dynamic> _$$BranchAndIc4DtoImplToJson(
        _$BranchAndIc4DtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
    };
