// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartProductRequestDto _$$_CartProductRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CartProductRequestDto(
      salesOrg: json['SalesOrg'] as String? ?? '',
      customerCode: json['CustomerCode'] as String? ?? '',
      shipTo: json['ShipToID'] as String? ?? '',
      productNumber: json['ProductID'] as String? ?? '',
      quantity: json['Quantity'] as int? ?? 0,
      itemSource: json['ItemSource'] as String? ?? 'EZRX',
      language: json['Language'] as String? ?? 'EN',
      parentID: json['ParentID'] as String? ?? '',
      counterOfferPrice: (json['CounterOfferPrice'] as num?)?.toDouble() ?? 0.0,
      comment: json['Comment'] as String? ?? '',
      counterOfferCurrency: json['CounterOfferCurrency'] as String? ?? '',
    );

Map<String, dynamic> _$$_CartProductRequestDtoToJson(
        _$_CartProductRequestDto instance) =>
    <String, dynamic>{
      'SalesOrg': instance.salesOrg,
      'CustomerCode': instance.customerCode,
      'ShipToID': instance.shipTo,
      'ProductID': instance.productNumber,
      'Quantity': instance.quantity,
      'ItemSource': instance.itemSource,
      'Language': instance.language,
      'ParentID': instance.parentID,
      'CounterOfferPrice': instance.counterOfferPrice,
      'Comment': instance.comment,
      'CounterOfferCurrency': instance.counterOfferCurrency,
    };
