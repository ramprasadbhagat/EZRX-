// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BundleInfoDto _$$_BundleInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_BundleInfoDto(
      sequence: json['sequence'] as int,
      quantity: json['quantity'] as int,
      type: json['type'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$_BundleInfoDtoToJson(_$_BundleInfoDto instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'quantity': instance.quantity,
      'type': instance.type,
      'rate': instance.rate,
    };
