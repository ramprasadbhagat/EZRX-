// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartProductDto _$$_CartProductDtoFromJson(Map<String, dynamic> json) =>
    _$_CartProductDto(
      productID: json['productID'] as String? ?? '',
      parentID: json['parentID'] as String? ?? '',
      type: json['type'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      therapeuticClass: json['therapeuticClass'] as String? ?? '',
      taxClassification: json['taxClassification'] as String? ?? '',
      isFOCMaterial: json['isFOCMaterial'] as bool? ?? false,
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      genericMaterialName: json['genericMaterialName'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      counterOfferPrice: (json['counterOfferPrice'] as num?)?.toDouble() ?? 0,
      counterOfferDiscount:
          (json['discountOverridePercentage'] as num?)?.toDouble() ?? 0,
      counterOfferCurrency: json['counterOfferCurrency'] as String? ?? '',
      remarks: json['comment'] as String? ?? '',
      bundleDetails: json['bundleDetails'] == null
          ? BundleDetailsDto.empty
          : BundleDetailsDto.fromJson(
              json['bundleDetails'] as Map<String, dynamic>),
      bundleMaterials: (json['bundleMaterials'] as List<dynamic>?)
              ?.map((e) => MaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bonusMaterials: (json['bonusMaterials'] as List<dynamic>?)
              ?.map(
                  (e) => BonusSampleItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tax: (handleTax(json, 'taxes') as num).toDouble(),
      hidePrice: json['hidePrice'] as bool? ?? false,
      isSuspended: json['suspensionStatus'] as bool? ?? false,
      isPrincipalSuspended: json['principalCutoffStatus'] as bool? ?? false,
      comboDeal: json['comboDeals'] == null
          ? PriceComboDealDto.empty
          : PriceComboDealDto.fromJson(
              json['comboDeals'] as Map<String, dynamic>),
      comboMaterials: (json['comboMaterials'] as List<dynamic>?)
              ?.map((e) =>
                  ComboMaterialItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      maximumQty: json['maximumQty'] as int? ?? 1,
    );

Map<String, dynamic> _$$_CartProductDtoToJson(_$_CartProductDto instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'parentID': instance.parentID,
      'type': instance.type,
      'quantity': instance.quantity,
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'therapeuticClass': instance.therapeuticClass,
      'taxClassification': instance.taxClassification,
      'isFOCMaterial': instance.isFOCMaterial,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'genericMaterialName': instance.genericMaterialName,
      'principalName': instance.principalName,
      'principalCode': instance.principalCode,
      'counterOfferPrice': instance.counterOfferPrice,
      'discountOverridePercentage': instance.counterOfferDiscount,
      'counterOfferCurrency': instance.counterOfferCurrency,
      'comment': instance.remarks,
      'bundleDetails': instance.bundleDetails.toJson(),
      'bundleMaterials':
          instance.bundleMaterials.map((e) => e.toJson()).toList(),
      'bonusMaterials': instance.bonusMaterials.map((e) => e.toJson()).toList(),
      'taxes': instance.tax,
      'hidePrice': instance.hidePrice,
      'suspensionStatus': instance.isSuspended,
      'principalCutoffStatus': instance.isPrincipalSuspended,
      'comboDeals': instance.comboDeal.toJson(),
      'comboMaterials': instance.comboMaterials.map((e) => e.toJson()).toList(),
      'maximumQty': instance.maximumQty,
    };

_$_BundleDetailsDto _$$_BundleDetailsDtoFromJson(Map<String, dynamic> json) =>
    _$_BundleDetailsDto(
      bundleName: json['bundleName'] as String? ?? '',
      bundleCode: json['bundleCode'] as String? ?? '',
      bundleInfo: (json['bundleInformation'] as List<dynamic>?)
              ?.map((e) => BundleInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_BundleDetailsDtoToJson(_$_BundleDetailsDto instance) =>
    <String, dynamic>{
      'bundleName': instance.bundleName,
      'bundleCode': instance.bundleCode,
      'bundleInformation': instance.bundleInfo.map((e) => e.toJson()).toList(),
    };
