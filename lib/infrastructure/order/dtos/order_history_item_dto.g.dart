// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryItemDto _$$_OrderHistoryItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderHistoryItemDto(
      materialNumber: json['MaterialCode'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
      qty: json['Qty'] as int? ?? 0,
      unitPrice: (json['UnitPrice'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['TotalPrice'] as num?)?.toDouble() ?? 0.0,
      status: json['Status'] as String? ?? '',
      deliveryDate: json['DeliveryDate'] as String? ?? '',
      orderNumber: json['OrderNumber'] as String? ?? '',
      createdDate: json['CreatedDate'] as String? ?? '',
      orderBy: json['OrderBy'] as String? ?? '',
      orderType: json['OrderType'] as String? ?? '',
      batch: json['Batch'] as String? ?? '',
      isBonusMaterial: json['IsBonusMaterial'] as bool? ?? false,
      telephoneNumber: json['TelephoneNumber'] as String? ?? '',
      invoiceNumber: json['InvoiceNumber'] as String? ?? '',
      pOReference: json['POReference'] as String? ?? '',
      manufactureName: json['ManufactureName'] as String? ?? '',
      expiryDate: json['ExpiryDate'] as String? ?? '',
      requestedDeliveryDate: json['RequestedDeliveryDate'] as String? ?? '',
      specialInstruction: json['SpecialInstructions'] as String? ?? '',
      tax: (json['Tax'] as num?)?.toDouble() ?? 0.0,
      eZRXNumber: json['EZRXNumber'] as String? ?? '',
      orderHistoryItemPoAttachments: (json['poAttachment'] as List<dynamic>?)
              ?.map((e) => PoDocumentsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      promoStatus: json['promoStatus'] as bool? ?? false,
      isBundle: json['IsBundle'] as bool? ?? false,
    );

Map<String, dynamic> _$$_OrderHistoryItemDtoToJson(
        _$_OrderHistoryItemDto instance) =>
    <String, dynamic>{
      'MaterialCode': instance.materialNumber,
      'MaterialDescription': instance.materialDescription,
      'Qty': instance.qty,
      'UnitPrice': instance.unitPrice,
      'TotalPrice': instance.totalPrice,
      'Status': instance.status,
      'DeliveryDate': instance.deliveryDate,
      'OrderNumber': instance.orderNumber,
      'CreatedDate': instance.createdDate,
      'OrderBy': instance.orderBy,
      'OrderType': instance.orderType,
      'Batch': instance.batch,
      'IsBonusMaterial': instance.isBonusMaterial,
      'TelephoneNumber': instance.telephoneNumber,
      'InvoiceNumber': instance.invoiceNumber,
      'POReference': instance.pOReference,
      'ManufactureName': instance.manufactureName,
      'ExpiryDate': instance.expiryDate,
      'RequestedDeliveryDate': instance.requestedDeliveryDate,
      'SpecialInstructions': instance.specialInstruction,
      'Tax': instance.tax,
      'EZRXNumber': instance.eZRXNumber,
      'poAttachment': instance.orderHistoryItemPoAttachments
          .map((e) => e.toJson())
          .toList(),
      'promoStatus': instance.promoStatus,
      'IsBundle': instance.isBundle,
    };
