// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BundleInfoDto _$$_BundleInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_BundleInfoDto(
      sequence: json['Sequence'] as int,
      quantity: json['Quantity'] as int,
      type: json['Type'] as String,
      rate: (json['Rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$_BundleInfoDtoToJson(_$_BundleInfoDto instance) =>
    <String, dynamic>{
      'Sequence': instance.sequence,
      'Quantity': instance.quantity,
      'Type': instance.type,
      'Rate': instance.rate,
    };
