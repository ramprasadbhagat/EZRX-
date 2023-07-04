// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDetailDto _$$_ProductDetailDtoFromJson(Map<String, dynamic> json) =>
    _$_ProductDetailDto(
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      unitOfMeasurement: json['unitOfMeasurement'] as String? ?? '',
      therapeuticClass: json['therapeuticClass'] as String? ?? '',
      genericMaterialName: json['genericMaterialName'] as String? ?? '',
      itemBrand: json['itemBrand'] as String? ?? '',
      materialBrand: json['materialBrand'] as String? ?? '',
      isFavourite: json['isFavourite'] as bool? ?? false,
      warehouseStorageCondition:
          json['warehouseStorageCondition'] as String? ?? '',
      defaultMaterialDescription:
          json['defaultMaterialDescription'] as String? ?? '',
      isMarketplaceProduct: json['isMarketplaceProduct'] as bool? ?? false,
      country: json['country'] as String? ?? '',
      countryName: json['countryName'] as String? ?? '',
      hidePrice: json['hidePrice'] as bool? ?? false,
      governmentMaterialCode: json['governmentMaterialCode'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      suspensionStatus: json['suspensionStatus'] as bool? ?? false,
      promoStatus: json['promoStatus'] as bool? ?? false,
      promoType: json['promoType'] as String? ?? '',
    );

Map<String, dynamic> _$$_ProductDetailDtoToJson(_$_ProductDetailDto instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'principalCode': instance.principalCode,
      'principalName': instance.principalName,
      'unitOfMeasurement': instance.unitOfMeasurement,
      'therapeuticClass': instance.therapeuticClass,
      'genericMaterialName': instance.genericMaterialName,
      'itemBrand': instance.itemBrand,
      'materialBrand': instance.materialBrand,
      'isFavourite': instance.isFavourite,
      'warehouseStorageCondition': instance.warehouseStorageCondition,
      'defaultMaterialDescription': instance.defaultMaterialDescription,
      'isMarketplaceProduct': instance.isMarketplaceProduct,
      'country': instance.country,
      'countryName': instance.countryName,
      'hidePrice': instance.hidePrice,
      'governmentMaterialCode': instance.governmentMaterialCode,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'suspensionStatus': instance.suspensionStatus,
      'promoStatus': instance.promoStatus,
      'promoType': instance.promoType,
    };
