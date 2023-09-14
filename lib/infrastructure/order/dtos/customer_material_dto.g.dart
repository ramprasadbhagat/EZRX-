// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_material_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerMaterialDto _$$_CustomerMaterialDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerMaterialDto(
      tax: (handleTax(json, 'Taxes') as num).toDouble(),
      taxm1: json['Taxm1'] as String? ?? '',
      taxClassification: json['TaxClassification'] as String? ?? '',
      materialNumber: json['MaterialNumber'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
      defaultMaterialDescription:
          json['defaultMaterialDescription'] as String? ?? '',
      principalName: json['PrincipalName'] as String? ?? '',
      principalCode: json['PrincipalCode'] as String? ?? '',
      therapeuticClass: json['TherapeuticClass'] as String? ?? '',
      itemBrand: json['ItemBrand'] as String? ?? '',
      hasValidTenderContract: json['hasValidTenderContract'] as bool? ?? false,
      hasMandatoryTenderContract:
          json['hasMandatoryTenderContract'] as bool? ?? false,
      hidePrice: json['hidePrice'] as bool? ?? false,
      governmentMaterialCode: json['GovernmentMaterialCode'] as String? ?? '',
      isSampleMaterial: json['IsSampleMaterial'] as bool? ?? false,
      itemRegistrationNumber: json['ItemRegistrationNumber'] as String? ?? '',
      unitOfMeasurement: json['UnitOfMeasurement'] as String? ?? '',
      materialGroup2: json['MaterialGroup2'] as String? ?? '',
      materialGroup4: json['MaterialGroup4'] as String? ?? '',
      isFOCMaterial: json['IsFOCMaterial'] as bool? ?? false,
      remarks: json['remarks'] as String? ?? '',
      genericMaterialName: json['genericMaterialName'] as String? ?? '',
    );

Map<String, dynamic> _$$_CustomerMaterialDtoToJson(
        _$_CustomerMaterialDto instance) =>
    <String, dynamic>{
      'Taxes': instance.tax,
      'Taxm1': instance.taxm1,
      'TaxClassification': instance.taxClassification,
      'MaterialNumber': instance.materialNumber,
      'MaterialDescription': instance.materialDescription,
      'defaultMaterialDescription': instance.defaultMaterialDescription,
      'PrincipalName': instance.principalName,
      'PrincipalCode': instance.principalCode,
      'TherapeuticClass': instance.therapeuticClass,
      'ItemBrand': instance.itemBrand,
      'hasValidTenderContract': instance.hasValidTenderContract,
      'hasMandatoryTenderContract': instance.hasMandatoryTenderContract,
      'hidePrice': instance.hidePrice,
      'GovernmentMaterialCode': instance.governmentMaterialCode,
      'IsSampleMaterial': instance.isSampleMaterial,
      'ItemRegistrationNumber': instance.itemRegistrationNumber,
      'UnitOfMeasurement': instance.unitOfMeasurement,
      'MaterialGroup2': instance.materialGroup2,
      'MaterialGroup4': instance.materialGroup4,
      'IsFOCMaterial': instance.isFOCMaterial,
      'remarks': instance.remarks,
      'genericMaterialName': instance.genericMaterialName,
    };
