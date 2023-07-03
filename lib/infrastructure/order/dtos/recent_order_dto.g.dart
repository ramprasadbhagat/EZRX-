// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecentOrderDto _$$_RecentOrderDtoFromJson(Map<String, dynamic> json) =>
    _$_RecentOrderDto(
      materialCode: json['MaterialCode'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
      defaultMaterialDescription:
          json['DefaultMaterialDescription'] as String? ?? '',
      qty: json['Qty'] as int? ?? 0,
      unitPrice: (json['UnitPrice'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['TotalPrice'] as num?)?.toDouble() ?? 0.0,
      manufactureName: json['ManufactureName'] as String? ?? '',
      seller: json['Seller'] as String? ?? '',
      isMarketplace: json['IsMarketplace'] as bool? ?? false,
      orderNumber: json['OrderNumber'] as String? ?? '',
      eZRXNumber: json['EZRXNumber'] as String? ?? '',
      warehouseStorageCondition:
          json['WarehouseStorageCondition'] as String? ?? '',
      available: json['Available'] as bool? ?? false,
      orderBy: json['OrderBy'] as String? ?? '',
      orderType: json['OrderType'] as String? ?? '',
      hidePrice: json['HidePrice'] as bool? ?? false,
    );

Map<String, dynamic> _$$_RecentOrderDtoToJson(_$_RecentOrderDto instance) =>
    <String, dynamic>{
      'MaterialCode': instance.materialCode,
      'MaterialDescription': instance.materialDescription,
      'DefaultMaterialDescription': instance.defaultMaterialDescription,
      'Qty': instance.qty,
      'UnitPrice': instance.unitPrice,
      'TotalPrice': instance.totalPrice,
      'ManufactureName': instance.manufactureName,
      'Seller': instance.seller,
      'IsMarketplace': instance.isMarketplace,
      'OrderNumber': instance.orderNumber,
      'EZRXNumber': instance.eZRXNumber,
      'WarehouseStorageCondition': instance.warehouseStorageCondition,
      'Available': instance.available,
      'OrderBy': instance.orderBy,
      'OrderType': instance.orderType,
      'HidePrice': instance.hidePrice,
    };
