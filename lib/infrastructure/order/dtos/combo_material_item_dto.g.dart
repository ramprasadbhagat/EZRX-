// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_material_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboMaterialItemDto _$$_ComboMaterialItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboMaterialItemDto(
      productId: json['productID'] as String? ?? '',
      parentId: json['parentID'] as String? ?? '',
      setNo: json['setNo'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      itemSource: json['ttemSource'] as String? ?? 'EZRX',
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      conditionNumber: json['conditionNumber'] as String? ?? '',
      mandatory: json['mandatory'] as bool? ?? false,
      suffix: json['suffix'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      principleName: json['principalName'] as String? ?? '',
      listPrice: (json['listPrice'] as num?)?.toDouble() ?? 0.0,
      itemCheck: json['ttemCheck'] as bool? ?? false,
      principalCode: json['principalCode'] as String? ?? '',
      valid: json['valid'] as bool? ?? false,
      type: json['type'] as String? ?? '',
      comboDealType: json['comboDealType'] as String? ?? '',
      isComboEligible: json['isComboEligible'] as bool? ?? false,
      finalIndividualPrice:
          (json['finalIndividualPrice'] as num?)?.toDouble() ?? 0.0,
      language: json['language'] as String? ?? '',
      materialNumber: json['materialNumber'] as String? ?? 'EN',
      taxM1: json['taxM1'] as String? ?? '',
      taxes:
          (json['taxes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$$_ComboMaterialItemDtoToJson(
        _$_ComboMaterialItemDto instance) =>
    <String, dynamic>{
      'productID': instance.productId,
      'parentID': instance.parentId,
      'setNo': instance.setNo,
      'quantity': instance.quantity,
      'ttemSource': instance.itemSource,
      'rate': instance.rate,
      'conditionNumber': instance.conditionNumber,
      'mandatory': instance.mandatory,
      'suffix': instance.suffix,
      'materialDescription': instance.materialDescription,
      'principalName': instance.principleName,
      'listPrice': instance.listPrice,
      'ttemCheck': instance.itemCheck,
      'principalCode': instance.principalCode,
      'valid': instance.valid,
      'type': instance.type,
      'comboDealType': instance.comboDealType,
      'isComboEligible': instance.isComboEligible,
      'finalIndividualPrice': instance.finalIndividualPrice,
      'language': instance.language,
      'materialNumber': instance.materialNumber,
      'taxM1': instance.taxM1,
      'taxes': instance.taxes,
    };
