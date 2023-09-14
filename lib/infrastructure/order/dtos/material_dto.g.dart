// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialDto _$$_MaterialDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialDto(
      governmentMaterialCode: json['governmentMaterialCode'] as String? ?? '',
      therapeuticClass: json['therapeuticClass'] as String? ?? '',
      itemBrand: json['itemBrand'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      taxClassification: json['taxClassification'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      unitOfMeasurement: json['unitOfMeasurement'] as String? ?? '',
      materialGroup2: json['materialGroup2'] as String? ?? '',
      materialGroup4: json['materialGroup4'] as String? ?? '',
      isSampleMaterial: json['isSampleMaterial'] as bool? ?? false,
      hasValidTenderContract: json['hasValidTenderContract'] as bool? ?? false,
      hasMandatoryTenderContract:
          json['hasMandatoryTenderContract'] as bool? ?? false,
      taxes: (handleTax(json, 'taxes') as num).toDouble(),
      defaultMaterialDescription:
          json['defaultMaterialDescription'] as String? ?? '',
      isFOCMaterial: json['isFOCMaterial'] as bool? ?? false,
      quantity: _validateQantity(json, 'Quantity') as int? ?? 0,
      remarks: json['remarks'] as String? ?? '',
      genericMaterialName: json['genericMaterialName'] as String? ?? '',
      ean: json['ean'] as String? ?? '',
      bundle: BundleDto.fromJson(
          _nullCheck(json, 'BundleInformation') as Map<String, dynamic>),
      code: json['Code'] as String? ?? '',
      name: json['Name'] as String? ?? '',
      principalCode:
          _principalCodeReadValue(json, 'PrincipalCode') as String? ?? '',
      materialNumber:
          _materialNumberReadValue(json, 'MaterialNumber') as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      manufactured: json['Manufactured'] as String? ?? '',
      isFavourite: json['IsFavourite'] as bool? ?? false,
      type: json['Type'] as String? ?? '',
      hidePrice: json['HidePrice'] as bool? ?? false,
      dataTotalCount: json['DataTotalCount'] as int? ?? 0,
      dataTotalHidden: json['DataTotalHidden'] as int? ?? 0,
      isGimmick: json['IsGimmick'] as bool? ?? false,
      data: (json['Data'] as List<dynamic>?)
              ?.map((e) => MaterialDataDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bundles: (json['bundles'] as List<dynamic>?)
              ?.map((e) => BundleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MaterialDtoToJson(_$_MaterialDto instance) =>
    <String, dynamic>{
      'governmentMaterialCode': instance.governmentMaterialCode,
      'therapeuticClass': instance.therapeuticClass,
      'itemBrand': instance.itemBrand,
      'principalName': instance.principalName,
      'taxClassification': instance.taxClassification,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'unitOfMeasurement': instance.unitOfMeasurement,
      'materialGroup2': instance.materialGroup2,
      'materialGroup4': instance.materialGroup4,
      'isSampleMaterial': instance.isSampleMaterial,
      'hasValidTenderContract': instance.hasValidTenderContract,
      'hasMandatoryTenderContract': instance.hasMandatoryTenderContract,
      'taxes': instance.taxes,
      'defaultMaterialDescription': instance.defaultMaterialDescription,
      'isFOCMaterial': instance.isFOCMaterial,
      'Quantity': instance.quantity,
      'remarks': instance.remarks,
      'genericMaterialName': instance.genericMaterialName,
      'ean': instance.ean,
      'BundleInformation': instance.bundle.toJson(),
      'Code': instance.code,
      'Name': instance.name,
      'PrincipalCode': instance.principalCode,
      'MaterialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'Manufactured': instance.manufactured,
      'IsFavourite': instance.isFavourite,
      'Type': instance.type,
      'HidePrice': instance.hidePrice,
      'DataTotalCount': instance.dataTotalCount,
      'DataTotalHidden': instance.dataTotalHidden,
      'IsGimmick': instance.isGimmick,
      'Data': instance.data.map((e) => e.toJson()).toList(),
      'bundles': instance.bundles.map((e) => e.toJson()).toList(),
    };

_$_MaterialDataDto _$$_MaterialDataDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialDataDto(
      code: materialNumberReadValue(json, 'Code') as String? ?? '',
      manufactured: json['Manufactured'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
      defaultMaterialDescription:
          json['DefaultMaterialDescription'] as String? ?? '',
      genericMaterialName: json['GenericMaterialName'] as String? ?? '',
      governmentMaterialCode: json['GovernmentMaterialCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_MaterialDataDtoToJson(_$_MaterialDataDto instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Manufactured': instance.manufactured,
      'MaterialDescription': instance.materialDescription,
      'DefaultMaterialDescription': instance.defaultMaterialDescription,
      'GenericMaterialName': instance.genericMaterialName,
      'GovernmentMaterialCode': instance.governmentMaterialCode,
    };

_$_MaterialResponseDto _$$_MaterialResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MaterialResponseDto(
      count: json['Count'] as int? ?? 0,
      products: (json['Products'] as List<dynamic>?)
              ?.map((e) => MaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MaterialResponseDtoToJson(
        _$_MaterialResponseDto instance) =>
    <String, dynamic>{
      'Count': instance.count,
      'Products': instance.products.map((e) => e.toJson()).toList(),
    };
