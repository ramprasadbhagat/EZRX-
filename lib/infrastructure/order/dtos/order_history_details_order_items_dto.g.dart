// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_order_items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryDetailsOrderItemDtoImpl
    _$$OrderHistoryDetailsOrderItemDtoImplFromJson(Map<String, dynamic> json) =>
        _$OrderHistoryDetailsOrderItemDtoImpl(
          type: json['Type'] as String? ?? '',
          materialNumber: json['MaterialCode'] as String,
          materialDescription: json['MaterialDescription'] as String? ?? '',
          qty: (json['Qty'] as num?)?.toInt() ?? 0,
          unitPrice: (json['UnitPrice'] as num?)?.toDouble() ?? 0.0,
          originPrice: (json['mrp'] as num?)?.toDouble() ?? 0.0,
          totalPrice: (json['TotalPrice'] as num?)?.toDouble() ?? 0.0,
          tax: (json['Tax'] as num?)?.toDouble() ?? 0.0,
          sAPStatus: json['SAPStatus'] as String? ?? '',
          plannedDeliveryDate: json['PlannedDeliveryDate'] as String? ?? '',
          pickedQuantity: (json['PickedQuantity'] as num?)?.toInt() ?? 0,
          batch: json['Batch'] as String? ?? '',
          expiryDate: json['ExpiryDate'] as String? ?? '',
          lineReferenceNotes: json['LineReferenceNotes'] as String? ?? '',
          lineNumber: json['LineNumber'] as String? ?? '',
          isTenderContractMaterial:
              boolStringFormatCheck(json, 'IsTenderContractMaterial')
                      as bool? ??
                  false,
          parentId: json['ParentID'] as String? ?? '',
          details: (json['Details'] as List<dynamic>?)
                  ?.map((e) => OrderHistoryDetailsOrderItemDetailsDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
          tenderContractDetails: OrderHistoryDetailsTenderContractDto.fromJson(
              orderHistoryDetailsOrderItemTenderContractDetailsOverride(
                  json, 'TenderContractDetails') as Map<String, dynamic>),
          principalName: json['PrincipalName'] as String? ?? '',
          principalCode: json['PrincipalCode'] as String? ?? '',
          governmentMaterialCode:
              json['GovernmentMaterialCode'] as String? ?? '',
          itemRegistrationNumber:
              json['ItemRegistrationNumber'] as String? ?? '',
          productType: _getProductType(json, 'ProductType') as String,
          promosStatus: json['promoStatus'] as bool? ?? false,
          isCounterOffer: json['isCounterOffer'] as bool? ?? false,
          hidePrice: json['HidePrice'] as bool? ?? false,
          isMarketPlace:
              mappingIsMarketPlace(json, 'isMarketPlace') as bool? ?? false,
          isCovid: json['isCovid'] as bool? ?? false,
          totalUnitPrice: (json['TotalUnitPrice'] as num?)?.toDouble() ?? 0.0,
          totalTax: (json['TotalTax'] as num?)?.toDouble() ?? 0.0,
          taxRate: (handleTax(json, 'TaxRate') as num).toDouble(),
        );

Map<String, dynamic> _$$OrderHistoryDetailsOrderItemDtoImplToJson(
        _$OrderHistoryDetailsOrderItemDtoImpl instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'MaterialCode': instance.materialNumber,
      'MaterialDescription': instance.materialDescription,
      'Qty': instance.qty,
      'UnitPrice': instance.unitPrice,
      'mrp': instance.originPrice,
      'TotalPrice': instance.totalPrice,
      'Tax': instance.tax,
      'SAPStatus': instance.sAPStatus,
      'PlannedDeliveryDate': instance.plannedDeliveryDate,
      'PickedQuantity': instance.pickedQuantity,
      'Batch': instance.batch,
      'ExpiryDate': instance.expiryDate,
      'LineReferenceNotes': instance.lineReferenceNotes,
      'LineNumber': instance.lineNumber,
      'IsTenderContractMaterial': instance.isTenderContractMaterial,
      'ParentID': instance.parentId,
      'Details': instance.details.map((e) => e.toJson()).toList(),
      'TenderContractDetails': instance.tenderContractDetails.toJson(),
      'PrincipalName': instance.principalName,
      'PrincipalCode': instance.principalCode,
      'GovernmentMaterialCode': instance.governmentMaterialCode,
      'ItemRegistrationNumber': instance.itemRegistrationNumber,
      'ProductType': instance.productType,
      'promoStatus': instance.promosStatus,
      'isCounterOffer': instance.isCounterOffer,
      'HidePrice': instance.hidePrice,
      'isMarketPlace': instance.isMarketPlace,
      'isCovid': instance.isCovid,
      'TotalUnitPrice': instance.totalUnitPrice,
      'TotalTax': instance.totalTax,
      'TaxRate': instance.taxRate,
    };
