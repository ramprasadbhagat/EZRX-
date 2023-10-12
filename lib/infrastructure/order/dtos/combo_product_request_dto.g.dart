// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_product_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboProductRequestDto _$$_ComboProductRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboProductRequestDto(
      productId: json['ProductID'] as String? ?? '',
      parentId: json['ParentID'] as String? ?? '',
      setNo: json['SetNo'] as String? ?? '',
      quantity: json['Quantity'] as int? ?? 0,
      itemSource: json['ItemSource'] as String? ?? 'EZRX',
      customerCode: json['CustomerCode'] as String? ?? '',
      shipToId: json['ShipToID'] as String? ?? '',
      salesOrg: json['SalesOrg'] as String? ?? '',
      minQty: json['MinQty'] as int? ?? 0,
      rate: (json['Rate'] as num?)?.toDouble() ?? 0,
      conditionNumber: json['ConditionNumber'] as String? ?? '',
      mandatory: json['Mandatory'] as bool? ?? false,
      suffix: json['Suffix'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
      principleName: json['PrincipleName'] as String? ?? '',
      listPrice: (json['ListPrice'] as num?)?.toDouble() ?? 0.0,
      itemCheck: json['ItemCheck'] as bool? ?? false,
      principalCode: json['PrincipalCode'] as String? ?? '',
      valid: json['Valid'] as bool? ?? false,
      type: json['Type'] as String? ?? '',
      comboDealType: json['ComboDealType'] as String? ?? '',
      isComboEligible: json['IsComboEligible'] as bool? ?? false,
      comboDeal: json['ComboDeals'] == null
          ? PriceComboDealDto.empty
          : PriceComboDealDto.fromJson(
              json['ComboDeals'] as Map<String, dynamic>),
      finalIndividualPrice:
          (json['FinalIndividualPrice'] as num?)?.toDouble() ?? 0.0,
      language: json['Language'] as String? ?? 'EN',
    );

Map<String, dynamic> _$$_ComboProductRequestDtoToJson(
        _$_ComboProductRequestDto instance) =>
    <String, dynamic>{
      'ProductID': instance.productId,
      'ParentID': instance.parentId,
      'SetNo': instance.setNo,
      'Quantity': instance.quantity,
      'ItemSource': instance.itemSource,
      'CustomerCode': instance.customerCode,
      'ShipToID': instance.shipToId,
      'SalesOrg': instance.salesOrg,
      'MinQty': instance.minQty,
      'Rate': instance.rate,
      'ConditionNumber': instance.conditionNumber,
      'Mandatory': instance.mandatory,
      'Suffix': instance.suffix,
      'MaterialDescription': instance.materialDescription,
      'PrincipleName': instance.principleName,
      'ListPrice': instance.listPrice,
      'ItemCheck': instance.itemCheck,
      'PrincipalCode': instance.principalCode,
      'Valid': instance.valid,
      'Type': instance.type,
      'ComboDealType': instance.comboDealType,
      'IsComboEligible': instance.isComboEligible,
      'ComboDeals': instance.comboDeal.toJson(),
      'FinalIndividualPrice': instance.finalIndividualPrice,
      'Language': instance.language,
    };
