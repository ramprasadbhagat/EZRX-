// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_sample_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BonusSampleItemDto _$$_BonusSampleItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_BonusSampleItemDto(
      materialNumber: json['materialNumber'] as String? ?? '',
      qty: json['productCount'] as int? ?? 0,
      principalName: json['principalName'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      itemId: json['ItemId'] as String? ?? '',
    );

Map<String, dynamic> _$$_BonusSampleItemDtoToJson(
        _$_BonusSampleItemDto instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'productCount': instance.qty,
      'principalName': instance.principalName,
      'materialDescription': instance.materialDescription,
      'principalCode': instance.principalCode,
      'ItemId': instance.itemId,
    };
