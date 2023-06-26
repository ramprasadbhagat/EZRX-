// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnItemDto _$$_ReturnItemDtoFromJson(Map<String, dynamic> json) =>
    _$_ReturnItemDto(
      requestId: json['requestId'] as String? ?? '',
      requestDate: json['requestDate'] as String? ?? '',
      itemQty: json['itemQty'] as String? ?? '',
      totalPrice: json['totalPrice'] as String? ?? '',
      status: json['status'] as String? ?? '',
      materialNumber: json['materialNumber'] as String? ?? '',
      materialName: json['materialName'] as String? ?? '',
      defaultMaterialDescription:
          json['DefaultMaterialDescription'] as String? ?? '',
      orderNumber: json['orderNumber'] as String? ?? '',
      invoiceID: json['invoiceID'] as String? ?? '',
      customerName: json['customerName'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
      expiry: json['expiry'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReturnItemDtoToJson(_$_ReturnItemDto instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'requestDate': instance.requestDate,
      'itemQty': instance.itemQty,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'materialNumber': instance.materialNumber,
      'materialName': instance.materialName,
      'DefaultMaterialDescription': instance.defaultMaterialDescription,
      'orderNumber': instance.orderNumber,
      'invoiceID': instance.invoiceID,
      'customerName': instance.customerName,
      'batch': instance.batch,
      'expiry': instance.expiry,
    };
