// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaintenanceItemDto _$$_MaintenanceItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MaintenanceItemDto(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      maxNumberOfItem: getMaximumOfItem(json, 'maxNumberOfItem') as int? ?? 0,
      banners: (getValueList(json, 'banners') as List<dynamic>?)
              ?.map((e) =>
                  MaintenanceBannerDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

_$_MaintenanceBannerDto _$$_MaintenanceBannerDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MaintenanceBannerDto(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      template: getName(json, 'template') as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      content: getValue(json, 'content') as String? ?? '',
      publishedDate: PublishedDateDto.fromJson(
          json['publishedDate'] as Map<String, dynamic>),
      hyperlink: getHyperLink(json, 'hyperlink') as String? ?? '',
      type: getValue(json, 'type') as String? ?? '',
      applicableModules:
          (getValueList(json, 'applicableModules') as List<dynamic>?)
                  ?.map((e) =>
                      ApplicableModulesDto.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
      enableCrossButton:
          getBooleanValue(json, 'enableCrossButton') as bool? ?? false,
      loginType: getValue(json, 'login') as String? ?? '',
    );

Map<String, dynamic> _$$_MaintenanceBannerDtoToJson(
        _$_MaintenanceBannerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'template': instance.template,
      'displayName': instance.displayName,
      'content': instance.content,
      'publishedDate': instance.publishedDate.toJson(),
      'hyperlink': instance.hyperlink,
      'type': instance.type,
      'applicableModules':
          instance.applicableModules.map((e) => e.toJson()).toList(),
      'enableCrossButton': instance.enableCrossButton,
      'login': instance.loginType,
    };

_$_ApplicableModulesDto _$$_ApplicableModulesDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ApplicableModulesDto(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
    );

Map<String, dynamic> _$$_ApplicableModulesDtoToJson(
        _$_ApplicableModulesDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
    };

_$_PublishedDateDto _$$_PublishedDateDtoFromJson(Map<String, dynamic> json) =>
    _$_PublishedDateDto(
      isoValue: json['isoValue'] as String? ?? '',
      formattedDateValue: json['formattedDateValue'] as String? ?? '',
    );

Map<String, dynamic> _$$_PublishedDateDtoToJson(_$_PublishedDateDto instance) =>
    <String, dynamic>{
      'isoValue': instance.isoValue,
      'formattedDateValue': instance.formattedDateValue,
    };
