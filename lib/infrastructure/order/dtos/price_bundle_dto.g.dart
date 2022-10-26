// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_bundle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceBundleDto _$$_PriceBundleDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceBundleDto(
      name: json['BundleName'] as String? ?? '',
      code: json['BundleCode'] as String? ?? '',
      information: (json['BundleInformation'] as List<dynamic>?)
              ?.map(
                  (e) => PriceBundleItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceBundleDtoToJson(_$_PriceBundleDto instance) =>
    <String, dynamic>{
      'BundleName': instance.name,
      'BundleCode': instance.code,
      'BundleInformation': instance.information,
    };

_$_PriceBundleItemDto _$$_PriceBundleItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PriceBundleItemDto(
      type: json['Type'] as String? ?? '',
      sequence: json['Sequence'] as int? ?? 0,
      quantity: json['Quantity'] as int? ?? 0,
      rate: (json['Rate'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_PriceBundleItemDtoToJson(
        _$_PriceBundleItemDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Sequence': instance.sequence,
      'Quantity': instance.quantity,
      'Rate': instance.rate,
    };
