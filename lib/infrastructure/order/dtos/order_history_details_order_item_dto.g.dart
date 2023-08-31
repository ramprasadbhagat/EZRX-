// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_order_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderItemDto _$$_OrderItemDtoFromJson(Map<String, dynamic> json) =>
    _$_OrderItemDto(
      materialCode: json['MaterialCode'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
      defaultMaterialDescription:
          json['DefaultMaterialDescription'] as String? ?? '',
    );

Map<String, dynamic> _$$_OrderItemDtoToJson(_$_OrderItemDto instance) =>
    <String, dynamic>{
      'MaterialCode': instance.materialCode,
      'MaterialDescription': instance.materialDescription,
      'DefaultMaterialDescription': instance.defaultMaterialDescription,
    };
