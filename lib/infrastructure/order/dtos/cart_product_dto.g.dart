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
      comment: json['Comment'] as String? ?? '',
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
      'Comment': instance.comment,
    };
