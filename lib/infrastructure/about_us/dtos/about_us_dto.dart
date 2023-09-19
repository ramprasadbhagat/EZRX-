import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_us_dto.freezed.dart';
part 'about_us_dto.g.dart';

@freezed
class AboutUsDto with _$AboutUsDto {
  const AboutUsDto._();

  const factory AboutUsDto({
    @JsonKey(name: 'banner', readValue: bannerReadValue)
        required BannerTemplateDto banner,
    @JsonKey(
      name: 'certifications',
      readValue: certificationReadValue,
    )
        required SliderTemplateDto certifications,
    @JsonKey(name: 'whoWeAre', readValue: whoWeAreReadValue)
        required HorizontalListTemplateDto whoWeAre,
    @JsonKey(name: 'whyUs', readValue: whyUsReadValue)
        required ContentSplitTemplateDto whyUs,
    @JsonKey(name: 'ourPartners', readValue: ourPartnerReadValue)
        required MediaListTemplateDto ourPartners,
    @JsonKey(name: 'reachUs', readValue: reachUsReadValue)
        required ContentSplitTemplateDto reachUs,
  }) = _AboutUsDto;

  AboutUs toDomain() {
    return AboutUs(
      whyUs: whyUs.toDomain,
      banner: banner.toDomain,
      reachUs: reachUs.toDomain,
      whoWeAre: whoWeAre.toDomain,
      ourPartners: ourPartners.toDomain,
      certifications: certifications.toDomain,
    );
  }

  factory AboutUsDto.fromJson(Map<String, dynamic> json) =>
      _$AboutUsDtoFromJson(json);
}

@freezed
class BannerTemplateDto with _$BannerTemplateDto {
  const BannerTemplateDto._();
  factory BannerTemplateDto({
    @JsonKey(name: 'media', readValue: mediaReadValue)
        required MediaValueDto media,
    @JsonKey(name: 'content') required TemplateValueItemDto content,
  }) = _BannerTemplateDto;

  factory BannerTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$BannerTemplateDtoFromJson(json);

  BannerTemplate get toDomain => BannerTemplate(
        media: media.toDomain,
        content: content.value,
      );
}

@freezed
class SliderTemplateDto with _$SliderTemplateDto {
  const SliderTemplateDto._();
  factory SliderTemplateDto({
    @JsonKey(name: 'title') required TemplateValueItemDto title,
    @JsonKey(name: 'certificates', readValue: readValueKey)
        required List<CertificationsDto> certificates,
  }) = _SliderTemplateDto;

  factory SliderTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$SliderTemplateDtoFromJson(json);

  SliderTemplate get toDomain => SliderTemplate(
        title: title.value,
        certificates: certificates.map((e) => e.toDomain).toList(),
      );
}

@freezed
class CertificationsDto with _$CertificationsDto {
  const CertificationsDto._();
  factory CertificationsDto({
    @JsonKey(name: 'certificationType')
        required TemplateValueItemDto certificationType,
    @JsonKey(name: 'certificationName')
        required TemplateValueItemDto certificationName,
    @JsonKey(name: 'description') required TemplateValueItemDto description,
    @JsonKey(name: 'certificationYear')
        required TemplateValueItemDto certificationYear,
  }) = _CertificationsDto;

  factory CertificationsDto.fromJson(Map<String, dynamic> json) =>
      _$CertificationsDtoFromJson(json);

  Certifications get toDomain => Certifications(
        description: description.value,
        certificationName: certificationName.value,
        certificationType: certificationType.value,
        certificationYear: certificationYear.value,
      );
}

@freezed
class HorizontalListTemplateDto with _$HorizontalListTemplateDto {
  const HorizontalListTemplateDto._();
  factory HorizontalListTemplateDto({
    @JsonKey(name: 'title')
        required TemplateValueItemDto title,
    @JsonKey(name: 'description')
        required TemplateValueItemDto description,
    @JsonKey(
      name: 'list',
      readValue: readValueKey,
    )
        required List<HorizontalListTemplateItemDto> achievements,
  }) = _HorizontalListTemplateDto;

  factory HorizontalListTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$HorizontalListTemplateDtoFromJson(json);

  HorizontalListTemplate get toDomain => HorizontalListTemplate(
        title: title.value,
        description: description.value,
        achievements: achievements.map((e) => e.toDomain).toList(),
      );
}

@freezed
class HorizontalListTemplateItemDto with _$HorizontalListTemplateItemDto {
  const HorizontalListTemplateItemDto._();
  factory HorizontalListTemplateItemDto({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'title') required TemplateValueItemDto title,
    @JsonKey(name: 'subTitle') required TemplateValueItemDto subTitle,
    @JsonKey(name: 'description') required TemplateValueItemDto description,
  }) = _HorizontalListTemplateItemDto;

  factory HorizontalListTemplateItemDto.fromJson(Map<String, dynamic> json) =>
      _$HorizontalListTemplateItemDtoFromJson(json);

  HorizontalListTemplateItem get toDomain => HorizontalListTemplateItem(
        title: title.value,
        subTitle: subTitle.value,
        description: description.value,
      );
}

@freezed
class ContentSplitTemplateDto with _$ContentSplitTemplateDto {
  const ContentSplitTemplateDto._();

  const factory ContentSplitTemplateDto({
    @JsonKey(name: 'title') required TemplateValueItemDto title,
    @JsonKey(name: 'subTitle') required TemplateValueItemDto subTitle,
    @JsonKey(name: 'description') required TemplateValueItemDto description,
    @JsonKey(
      name: 'media',
      readValue: mediaReadValue,
    )
        required MediaValueDto media,
  }) = _ContentSplitTemplateDto;

  factory ContentSplitTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$ContentSplitTemplateDtoFromJson(json);

  ContentSplitTemplate get toDomain => ContentSplitTemplate(
        title: title.value,
        media: media.toDomain,
        subTitle: subTitle.value,
        description: description.value,
      );
}

@freezed
class MediaListTemplateDto with _$MediaListTemplateDto {
  const MediaListTemplateDto._();
  const factory MediaListTemplateDto({
    @JsonKey(name: 'title')
        required TemplateValueItemDto title,
    @JsonKey(name: 'description')
        required TemplateValueItemDto description,
    @JsonKey(
      name: 'mediaItems',
      defaultValue: <MediaItemDto>[],
      readValue: readValueKey,
    )
        required List<MediaItemDto> mediaItems,
  }) = _MediaListTemplateDto;

  MediaListTemplate get toDomain => MediaListTemplate(
        title: title.value,
        description: description.value,
        mediaItems: mediaItems.map((e) => e.toDomain).toList(),
      );

  factory MediaListTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$MediaListTemplateDtoFromJson(json);
}

@freezed
class MediaItemDto with _$MediaItemDto {
  const MediaItemDto._();
  factory MediaItemDto({
    @JsonKey(name: 'url') required TemplateValueItemDto url,
  }) = _MediaItemDto;

  MediaItem get toDomain => MediaItem(url: url.value);

  factory MediaItemDto.fromJson(Map<String, dynamic> json) =>
      _$MediaItemDtoFromJson(json);
}

@freezed
class MediaValueDto with _$MediaValueDto {
  const MediaValueDto._();
  factory MediaValueDto({
    @JsonKey(name: 'src', defaultValue: '') required String src,
  }) = _MediaValueDto;

  MediaValue get toDomain => MediaValue(src: src);

  factory MediaValueDto.fromJson(Map<String, dynamic> json) =>
      _$MediaValueDtoFromJson(json);
}

@freezed
class TemplateValueItemDto with _$TemplateValueItemDto {
  const factory TemplateValueItemDto({
    @JsonKey(name: 'value', defaultValue: '') required String value,
  }) = _TemplateValueItemDto;

  factory TemplateValueItemDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateValueItemDtoFromJson(json);
}

List<dynamic> readValueKey(Map json, String key) => json[key]['value'];

Map<dynamic, dynamic> mediaReadValue(Map json, String key) =>
    json[key]?['jsonValue']?['value'] ?? {};


Map<dynamic, dynamic> whoWeAreReadValue(Map json, String _) {
  final values = json['value'] as List;

  return values.firstWhere(
    (element) =>
        (element['name'] as String).toLowerCase().contains('who we are'),
    orElse: () => {},
  );
}

Map<dynamic, dynamic> certificationReadValue(Map json, String _) {
  final values = json['value'] as List;

  return values.firstWhere(
    (element) => element.containsKey('certificates'),
    orElse: () => {},
  );
}

Map<dynamic, dynamic> bannerReadValue(Map json, String _) {
  final values = json['value'] as List;

  return values.firstWhere(
    (element) => (element['name'] as String).toLowerCase().contains('banner 1'),
    orElse: () => {},
  );
}

Map<dynamic, dynamic> whyUsReadValue(Map json, String _) {
  final values = json['value'] as List;

  return values.firstWhere(
    (element) =>
        ((element['title']?['value'] ?? '') as String)
        .toLowerCase()
        .contains('why us'),
    orElse: () => {},
  );
}

Map<dynamic, dynamic> ourPartnerReadValue(Map json, String _) {
  final values = json['value'] as List;

  return values.firstWhere(
    (element) => ((element['title']?['value'] ?? '') as String)
        .toLowerCase()
        .contains('our partners'),
    orElse: () => {},
  );
}

Map<dynamic, dynamic> reachUsReadValue(Map json, String _) {
  final values = json['value'] as List;

  return values.firstWhere(
    (element) => ((element['title']?['value'] ?? '') as String)
        .toLowerCase()
        .contains('reaching us'),
    orElse: () => {},
  );
}
