// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_order_items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryDetailsOrderItemDto _$$_OrderHistoryDetailsOrderItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderHistoryDetailsOrderItemDto(
      type: json['Type'] as String? ?? '',
      materialNumber: json['MaterialCode'] as String,
      materialDescription: json['MaterialDescription'] as String? ?? '',
      qty: json['Qty'] as int? ?? 0,
      unitPrice: (json['UnitPrice'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['TotalPrice'] as num?)?.toDouble() ?? 0.0,
      tax: (json['Tax'] as num?)?.toDouble() ?? 0.0,
      sAPStatus: json['SAPStatus'] as String? ?? '',
      plannedDeliveryDate: json['PlannedDeliveryDate'] as String? ?? '',
      pickedQuantity: json['PickedQuantity'] as int? ?? 0,
      batch: json['Batch'] as String? ?? '',
      expiryDate: json['ExpiryDate'] as String? ?? '',
      lineReferenceNotes: json['LineReferenceNotes'] as String? ?? '',
      isTenderContractMaterial:
          boolStringFormatCheck(json, 'IsTenderContractMaterial') as bool? ??
              false,
      parentId: json['ParentID'] as String? ?? '',
      details: (json['Details'] as List<dynamic>?)
              ?.map((e) => OrderHistoryDetailsOrderItemDetailsDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      tenderContractDetails:
          OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson(
              orderHistoryDetailsOrderItemTenderContractDetailsOverride(
                  json, 'TenderContractDetails') as Map<String, dynamic>),
      principalName: json['PrincipalName'] as String? ?? '',
      principalCode: json['PrincipalCode'] as String? ?? '',
      governmentMaterialCode: json['GovernmentMaterialCode'] as String? ?? '',
      productType: json['ProductType'] as String? ?? '',
    );

Map<String, dynamic> _$$_OrderHistoryDetailsOrderItemDtoToJson(
        _$_OrderHistoryDetailsOrderItemDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'MaterialCode': instance.materialNumber,
      'MaterialDescription': instance.materialDescription,
      'Qty': instance.qty,
      'UnitPrice': instance.unitPrice,
      'TotalPrice': instance.totalPrice,
      'Tax': instance.tax,
      'SAPStatus': instance.sAPStatus,
      'PlannedDeliveryDate': instance.plannedDeliveryDate,
      'PickedQuantity': instance.pickedQuantity,
      'Batch': instance.batch,
      'ExpiryDate': instance.expiryDate,
      'LineReferenceNotes': instance.lineReferenceNotes,
      'IsTenderContractMaterial': instance.isTenderContractMaterial,
      'ParentID': instance.parentId,
      'Details': instance.details.map((e) => e.toJson()).toList(),
      'TenderContractDetails': instance.tenderContractDetails.toJson(),
      'PrincipalName': instance.principalName,
      'PrincipalCode': instance.principalCode,
      'GovernmentMaterialCode': instance.governmentMaterialCode,
      'ProductType': instance.productType,
    };
