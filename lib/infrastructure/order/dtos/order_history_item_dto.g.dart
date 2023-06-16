// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryItemDto _$$_OrderHistoryItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderHistoryItemDto(
      materialNumber: json['MaterialCode'] as String,
      materialDescription: json['MaterialDescription'] as String,
      qty: json['Qty'] as int,
      unitPrice: (json['UnitPrice'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['TotalPrice'] as num?)?.toDouble() ?? 0.0,
      status: json['Status'] as String? ?? '',
      deliveryDate: json['DeliveryDate'] as String,
      deliveryTime: json['DeliveryTime'] as String,
      lineNumber: json['LineNumber'] as String,
      tax: (json['Tax'] as num?)?.toDouble() ?? 0.0,
      orderType: json['OrderType'] as String,
      orderNumber: json['OrderNumber'] as String? ?? '',
      ezrxNumber: json['EZRXNumber'] as String,
      createdDate: json['CreatedDate'] as String,
      createdTime: json['CreatedTime'] as String,
      orderBy: json['OrderBy'] as String,
      purchaseOrderType: json['PurchaseOrderType'] as String,
      defaultMaterialDescription: json['DefaultMaterialDescription'] as String,
      warehouseStorageCondition: json['WarehouseStorageCondition'] as String,
      batch: json['Batch'] as String,
      available: json['Available'] as bool,
      isMarketplace: json['IsMarketplace'] as bool,
      isBonusMaterial: json['IsBonusMaterial'] as bool,
      governmentMaterialCode: json['GovernmentMaterialCode'] as String,
      telephoneNumber: json['TelephoneNumber'] as String,
      seller: json['Seller'] as String,
      invoiceNumber: json['InvoiceNumber'] as String,
      pOReference: json['POReference'] as String,
      manufactureName: json['ManufactureName'] as String,
      expiryDate: json['ExpiryDate'] as String,
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
      'DeliveryTime': instance.deliveryTime,
      'LineNumber': instance.lineNumber,
      'Tax': instance.tax,
      'OrderType': instance.orderType,
      'OrderNumber': instance.orderNumber,
      'EZRXNumber': instance.ezrxNumber,
      'CreatedDate': instance.createdDate,
      'CreatedTime': instance.createdTime,
      'OrderBy': instance.orderBy,
      'PurchaseOrderType': instance.purchaseOrderType,
      'DefaultMaterialDescription': instance.defaultMaterialDescription,
      'WarehouseStorageCondition': instance.warehouseStorageCondition,
      'Batch': instance.batch,
      'Available': instance.available,
      'IsMarketplace': instance.isMarketplace,
      'IsBonusMaterial': instance.isBonusMaterial,
      'GovernmentMaterialCode': instance.governmentMaterialCode,
      'TelephoneNumber': instance.telephoneNumber,
      'Seller': instance.seller,
      'InvoiceNumber': instance.invoiceNumber,
      'POReference': instance.pOReference,
      'ManufactureName': instance.manufactureName,
      'ExpiryDate': instance.expiryDate,
    };
