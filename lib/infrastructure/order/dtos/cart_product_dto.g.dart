// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartProductDto _$$_CartProductDtoFromJson(Map<String, dynamic> json) =>
    _$_CartProductDto(
      productID: json['ProductID'] as String? ?? '',
      parentID: json['ParentID'] as String? ?? '',
      type: json['Type'] as String? ?? '',
      quantity: json['Quantity'] as int? ?? 0,
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      therapeuticClass: json['therapeuticClass'] as String? ?? '',
      taxClassification: json['taxClassification'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      genericMaterialName: json['genericMaterialName'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      counterOfferPrice: (json['CounterOfferPrice'] as num?)?.toDouble() ?? 0,
      counterOfferCurrency: json['CounterOfferCurrency'] as String? ?? '',
      remarks: json['Comment'] as String? ?? '',
      bundleDetails: json['BundleDetails'] == null
          ? BundleDetailsDto.empty
          : BundleDetailsDto.fromJson(
              json['BundleDetails'] as Map<String, dynamic>),
      bundleMaterials: (json['BundleMaterials'] as List<dynamic>?)
              ?.map((e) => MaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      taxes:
          (json['taxes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$$_CartProductDtoToJson(_$_CartProductDto instance) =>
    <String, dynamic>{
      'ProductID': instance.productID,
      'ParentID': instance.parentID,
      'Type': instance.type,
      'Quantity': instance.quantity,
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'therapeuticClass': instance.therapeuticClass,
      'taxClassification': instance.taxClassification,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'genericMaterialName': instance.genericMaterialName,
      'principalName': instance.principalName,
      'CounterOfferPrice': instance.counterOfferPrice,
      'CounterOfferCurrency': instance.counterOfferCurrency,
      'Comment': instance.remarks,
      'BundleDetails': instance.bundleDetails.toJson(),
      'BundleMaterials':
          instance.bundleMaterials.map((e) => e.toJson()).toList(),
      'taxes': instance.taxes,
    };

_$_BundleDetailsDto _$$_BundleDetailsDtoFromJson(Map<String, dynamic> json) =>
    _$_BundleDetailsDto(
      bundleName: json['BundleName'] as String? ?? '',
      bundleCode: json['BundleCode'] as String? ?? '',
      bundleInfo: (json['BundleInformation'] as List<dynamic>?)
              ?.map((e) => BundleInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_BundleDetailsDtoToJson(_$_BundleDetailsDto instance) =>
    <String, dynamic>{
      'BundleName': instance.bundleName,
      'BundleCode': instance.bundleCode,
      'BundleInformation': instance.bundleInfo.map((e) => e.toJson()).toList(),
    };
