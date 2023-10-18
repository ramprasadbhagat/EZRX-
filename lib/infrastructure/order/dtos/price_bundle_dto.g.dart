// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_bundle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceBundleDto _$$_PriceBundleDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceBundleDto(
      name: json['bundleName'] as String? ?? '',
      code: json['bundleCode'] as String? ?? '',
      conditions: json['conditions'] as String? ?? '',
      bonusEligible: json['bonusEligible'] as bool? ?? false,
      information: (json['bundleInformation'] as List<dynamic>?)
              ?.map(
                  (e) => PriceBundleItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceBundleDtoToJson(_$_PriceBundleDto instance) =>
    <String, dynamic>{
      'bundleName': instance.name,
      'bundleCode': instance.code,
      'conditions': instance.conditions,
      'bonusEligible': instance.bonusEligible,
      'bundleInformation': instance.information.map((e) => e.toJson()).toList(),
    };

_$_PriceBundleItemDto _$$_PriceBundleItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PriceBundleItemDto(
      type: json['type'] as String? ?? '',
      sequence: json['sequence'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_PriceBundleItemDtoToJson(
        _$_PriceBundleItemDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'sequence': instance.sequence,
      'quantity': instance.quantity,
      'rate': instance.rate,
    };
