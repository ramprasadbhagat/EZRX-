// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AboutUsDto _$$_AboutUsDtoFromJson(Map<String, dynamic> json) =>
    _$_AboutUsDto(
      banner: BannerTemplateDto.fromJson(
          bannerReadValue(json, 'banner') as Map<String, dynamic>),
      certifications: SliderTemplateDto.fromJson(
          certificationReadValue(json, 'certifications')
              as Map<String, dynamic>),
      whoWeAre: HorizontalListTemplateDto.fromJson(
          whoWeAreReadValue(json, 'whoWeAre') as Map<String, dynamic>),
      ourPartners: MediaListTemplateDto.fromJson(
          ourPartnerReadValue(json, 'ourPartners') as Map<String, dynamic>),
      contentSplit:
          (contentSplitReadValue(json, 'contentSplit') as List<dynamic>)
              .map((e) =>
                  ContentSplitTemplateDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_AboutUsDtoToJson(_$_AboutUsDto instance) =>
    <String, dynamic>{
      'banner': instance.banner.toJson(),
      'certifications': instance.certifications.toJson(),
      'whoWeAre': instance.whoWeAre.toJson(),
      'ourPartners': instance.ourPartners.toJson(),
      'contentSplit': instance.contentSplit.map((e) => e.toJson()).toList(),
    };

_$_BannerTemplateDto _$$_BannerTemplateDtoFromJson(Map<String, dynamic> json) =>
    _$_BannerTemplateDto(
      media: MediaValueDto.fromJson(
          mediaReadValue(json, 'media') as Map<String, dynamic>),
      content: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'content') as Map<String, dynamic>),
      title: readValue(json, 'title') as String,
      buttonName: readValue(json, 'buttonName') as String,
    );

Map<String, dynamic> _$$_BannerTemplateDtoToJson(
        _$_BannerTemplateDto instance) =>
    <String, dynamic>{
      'media': instance.media.toJson(),
      'content': instance.content.toJson(),
      'title': instance.title,
      'buttonName': instance.buttonName,
    };

_$_SliderTemplateDto _$$_SliderTemplateDtoFromJson(Map<String, dynamic> json) =>
    _$_SliderTemplateDto(
      title: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'title') as Map<String, dynamic>),
      certificates: (readValueKey(json, 'certificates') as List<dynamic>)
          .map((e) => CertificationsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SliderTemplateDtoToJson(
        _$_SliderTemplateDto instance) =>
    <String, dynamic>{
      'title': instance.title.toJson(),
      'certificates': instance.certificates.map((e) => e.toJson()).toList(),
    };

_$_CertificationsDto _$$_CertificationsDtoFromJson(Map<String, dynamic> json) =>
    _$_CertificationsDto(
      certificationType: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'certificationType')
              as Map<String, dynamic>),
      certificationName: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'certificationName')
              as Map<String, dynamic>),
      description: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'description') as Map<String, dynamic>),
      certificationYear: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'certificationYear')
              as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CertificationsDtoToJson(
        _$_CertificationsDto instance) =>
    <String, dynamic>{
      'certificationType': instance.certificationType.toJson(),
      'certificationName': instance.certificationName.toJson(),
      'description': instance.description.toJson(),
      'certificationYear': instance.certificationYear.toJson(),
    };

_$_HorizontalListTemplateDto _$$_HorizontalListTemplateDtoFromJson(
        Map<String, dynamic> json) =>
    _$_HorizontalListTemplateDto(
      title: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'title') as Map<String, dynamic>),
      description: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'description') as Map<String, dynamic>),
      achievements: (readValueKey(json, 'list') as List<dynamic>)
          .map((e) =>
              HorizontalListTemplateItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HorizontalListTemplateDtoToJson(
        _$_HorizontalListTemplateDto instance) =>
    <String, dynamic>{
      'title': instance.title.toJson(),
      'description': instance.description.toJson(),
      'list': instance.achievements.map((e) => e.toJson()).toList(),
    };

_$_HorizontalListTemplateItemDto _$$_HorizontalListTemplateItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_HorizontalListTemplateItemDto(
      name: json['name'] as String,
      title: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'title') as Map<String, dynamic>),
      subTitle: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'subTitle') as Map<String, dynamic>),
      description: TemplateValueItemDto.fromJson(
          json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HorizontalListTemplateItemDtoToJson(
        _$_HorizontalListTemplateItemDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title.toJson(),
      'subTitle': instance.subTitle.toJson(),
      'description': instance.description.toJson(),
    };

_$_ContentSplitTemplateDto _$$_ContentSplitTemplateDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ContentSplitTemplateDto(
      title: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'title') as Map<String, dynamic>),
      subTitle: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'subTitle') as Map<String, dynamic>),
      description: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'description') as Map<String, dynamic>),
      media: MediaValueDto.fromJson(
          mediaReadValue(json, 'media') as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ContentSplitTemplateDtoToJson(
        _$_ContentSplitTemplateDto instance) =>
    <String, dynamic>{
      'title': instance.title.toJson(),
      'subTitle': instance.subTitle.toJson(),
      'description': instance.description.toJson(),
      'media': instance.media.toJson(),
    };

_$_MediaListTemplateDto _$$_MediaListTemplateDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MediaListTemplateDto(
      title: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'title') as Map<String, dynamic>),
      description: TemplateValueItemDto.fromJson(
          readDynamicValueKey(json, 'description') as Map<String, dynamic>),
      mediaItems: (readValueKey(json, 'mediaItems') as List<dynamic>?)
              ?.map((e) => MediaItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MediaListTemplateDtoToJson(
        _$_MediaListTemplateDto instance) =>
    <String, dynamic>{
      'title': instance.title.toJson(),
      'description': instance.description.toJson(),
      'mediaItems': instance.mediaItems.map((e) => e.toJson()).toList(),
    };

_$_MediaItemDto _$$_MediaItemDtoFromJson(Map<String, dynamic> json) =>
    _$_MediaItemDto(
      url: TemplateValueItemDto.fromJson(json['url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MediaItemDtoToJson(_$_MediaItemDto instance) =>
    <String, dynamic>{
      'url': instance.url.toJson(),
    };

_$_MediaValueDto _$$_MediaValueDtoFromJson(Map<String, dynamic> json) =>
    _$_MediaValueDto(
      src: json['src'] as String? ?? '',
    );

Map<String, dynamic> _$$_MediaValueDtoToJson(_$_MediaValueDto instance) =>
    <String, dynamic>{
      'src': instance.src,
    };

_$_TemplateValueItemDto _$$_TemplateValueItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_TemplateValueItemDto(
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$$_TemplateValueItemDtoToJson(
        _$_TemplateValueItemDto instance) =>
    <String, dynamic>{
      'value': instance.value,
    };
