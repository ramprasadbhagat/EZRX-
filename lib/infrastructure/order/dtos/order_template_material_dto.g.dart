// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_template_material_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderTemplateMaterialDto _$$_OrderTemplateMaterialDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderTemplateMaterialDto(
      materialNumber: json['materialNumber'] as String? ?? '',
      qty: json['qty'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      hidePrice: json['hidePrice'] as bool? ?? false,
      taxClassification: json['taxClassification'] as String? ?? '',
    );

Map<String, dynamic> _$$_OrderTemplateMaterialDtoToJson(
        _$_OrderTemplateMaterialDto instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'qty': instance.qty,
      'type': instance.type,
      'principalName': instance.principalName,
      'materialDescription': instance.materialDescription,
      'hidePrice': instance.hidePrice,
      'taxClassification': instance.taxClassification,
    };
