// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItemDto _$$_CartItemDtoFromJson(Map<String, dynamic> json) =>
    _$_CartItemDto(
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      materialType: json['type'] as String? ?? '',
      materialQuantity: json['qty'] as int? ?? 0,
      principalName: json['principalName'] as String? ?? '',
      taxClassification: json['taxClassification'] as String? ?? '',
      hidePrice: json['hidePrice'] as bool? ?? false,
      hasValidTenderContract: json['hasValidTenderContract'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CartItemDtoToJson(_$_CartItemDto instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'type': instance.materialType,
      'qty': instance.materialQuantity,
      'principalName': instance.principalName,
      'taxClassification': instance.taxClassification,
      'hidePrice': instance.hidePrice,
      'hasValidTenderContract': instance.hasValidTenderContract,
    };
