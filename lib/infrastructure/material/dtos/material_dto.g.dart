// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialDto _$$_MaterialDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialDto(
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      governmentMaterialCode: json['governmentMaterialCode'] as String? ?? '',
      therapeuticClass: json['therapeuticClass'] as String? ?? '',
      itemBrand: json['itemBrand'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      taxClassification: json['taxClassification'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      unitOfMeasurement: json['unitOfMeasurement'] as String? ?? '',
      materialGroup2: json['materialGroup2'] as String? ?? '',
      materialGroup4: json['materialGroup4'] as String? ?? '',
      isSampleMaterial: json['isSampleMaterial'] as bool? ?? false,
      hidePrice: json['hidePrice'] as bool? ?? false,
      hasValidTenderContract: json['hasValidTenderContract'] as bool? ?? false,
      hasMandatoryTenderContract:
          json['hasMandatoryTenderContract'] as bool? ?? false,
      taxes:
          (json['taxes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$$_MaterialDtoToJson(_$_MaterialDto instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'governmentMaterialCode': instance.governmentMaterialCode,
      'therapeuticClass': instance.therapeuticClass,
      'itemBrand': instance.itemBrand,
      'principalName': instance.principalName,
      'principalCode': instance.principalCode,
      'taxClassification': instance.taxClassification,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'unitOfMeasurement': instance.unitOfMeasurement,
      'materialGroup2': instance.materialGroup2,
      'materialGroup4': instance.materialGroup4,
      'isSampleMaterial': instance.isSampleMaterial,
      'hidePrice': instance.hidePrice,
      'hasValidTenderContract': instance.hasValidTenderContract,
      'hasMandatoryTenderContract': instance.hasMandatoryTenderContract,
      'taxes': instance.taxes,
    };
