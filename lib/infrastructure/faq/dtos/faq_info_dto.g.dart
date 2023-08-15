// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FAQInfoDto _$$_FAQInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_FAQInfoDto(
      endCursor: getEndCursorValue(json, 'pageInfo') as String? ?? '',
      faqList: (json['results'] as List<dynamic>?)
              ?.map((e) => FAQItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_FAQInfoDtoToJson(_$_FAQInfoDto instance) =>
    <String, dynamic>{
      'pageInfo': instance.endCursor,
      'results': instance.faqList.map((e) => e.toJson()).toList(),
    };
