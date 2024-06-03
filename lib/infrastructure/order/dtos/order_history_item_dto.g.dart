// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryItemDtoImpl _$$OrderHistoryItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderHistoryItemDtoImpl(
      materialNumber: json['MaterialCode'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
      qty: (json['Qty'] as num?)?.toInt() ?? 0,
      unitPrice: (json['UnitPrice'] as num?)?.toDouble() ?? 0.0,
      originPrice: (json['mrp'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['TotalPrice'] as num?)?.toDouble() ?? 0.0,
      status: json['Status'] as String? ?? '',
      deliveryDate: json['DeliveryDate'] as String? ?? '',
      orderNumber: json['OrderNumber'] as String? ?? '',
      createdDate: _createdDateTimeReadValue(json, 'createdDate') as String,
      orderBy: json['OrderBy'] as String? ?? '',
      orderType: json['OrderType'] as String? ?? '',
      batch: json['Batch'] as String? ?? '',
      isBonusMaterial: json['IsBonusMaterial'] as bool? ?? false,
      telephoneNumber: json['TelephoneNumber'] as String? ?? '',
      invoiceNumber: json['InvoiceNumber'] as String? ?? '',
      pOReference: json['POReference'] as String? ?? '',
      manufactureName: json['ManufactureName'] as String? ?? '',
      governmentMaterialCode: json['GovernmentMaterialCode'] as String? ?? '',
      itemRegistrationNumber: json['ItemRegistrationNumber'] as String? ?? '',
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
      isCounterOffer: json['isCounterOffer'] as bool? ?? false,
      isBundle: json['IsBundle'] as bool? ?? false,
      lineNumber: json['LineNumber'] as String? ?? '',
      principalCode: json['PrincipalCode'] as String? ?? '',
      hidePrice: json['HidePrice'] as bool? ?? false,
      referenceNotes: json['referenceNotes'] as String? ?? '',
      isMarketPlace:
          mappingIsMarketPlace(json, 'isMarketPlace') as bool? ?? false,
      tenderContractNumber: json['TenderContractNumber'] as String? ?? '',
      tenderContractReference: json['TenderContractReference'] as String? ?? '',
      tenderOrderReason: json['TenderOrderReason'] as String? ?? '',
      tenderPriceUnit: (json['TenderPriceUnit'] as num?)?.toInt() ?? 0,
      tenderPrice: json['TenderPrice'] as String? ?? '',
      isTenderExpired: json['isTenderExpire'] as bool? ?? false,
      isCovid: json['isCovid'] as bool? ?? false,
    );

Map<String, dynamic> _$$OrderHistoryItemDtoImplToJson(
        _$OrderHistoryItemDtoImpl instance) =>
    <String, dynamic>{
      'MaterialCode': instance.materialNumber,
      'MaterialDescription': instance.materialDescription,
      'Qty': instance.qty,
      'UnitPrice': instance.unitPrice,
      'mrp': instance.originPrice,
      'TotalPrice': instance.totalPrice,
      'Status': instance.status,
      'DeliveryDate': instance.deliveryDate,
      'OrderNumber': instance.orderNumber,
      'createdDate': instance.createdDate,
      'OrderBy': instance.orderBy,
      'OrderType': instance.orderType,
      'Batch': instance.batch,
      'IsBonusMaterial': instance.isBonusMaterial,
      'TelephoneNumber': instance.telephoneNumber,
      'InvoiceNumber': instance.invoiceNumber,
      'POReference': instance.pOReference,
      'ManufactureName': instance.manufactureName,
      'GovernmentMaterialCode': instance.governmentMaterialCode,
      'ItemRegistrationNumber': instance.itemRegistrationNumber,
      'ExpiryDate': instance.expiryDate,
      'RequestedDeliveryDate': instance.requestedDeliveryDate,
      'SpecialInstructions': instance.specialInstruction,
      'Tax': instance.tax,
      'EZRXNumber': instance.eZRXNumber,
      'poAttachment': instance.orderHistoryItemPoAttachments
          .map((e) => e.toJson())
          .toList(),
      'promoStatus': instance.promoStatus,
      'isCounterOffer': instance.isCounterOffer,
      'IsBundle': instance.isBundle,
      'LineNumber': instance.lineNumber,
      'PrincipalCode': instance.principalCode,
      'HidePrice': instance.hidePrice,
      'referenceNotes': instance.referenceNotes,
      'isMarketPlace': instance.isMarketPlace,
      'TenderContractNumber': instance.tenderContractNumber,
      'TenderContractReference': instance.tenderContractReference,
      'TenderOrderReason': instance.tenderOrderReason,
      'TenderPriceUnit': instance.tenderPriceUnit,
      'TenderPrice': instance.tenderPrice,
      'isTenderExpire': instance.isTenderExpired,
      'isCovid': instance.isCovid,
    };
