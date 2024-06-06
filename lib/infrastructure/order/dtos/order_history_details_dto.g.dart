// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryDetailsDtoImpl _$$OrderHistoryDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderHistoryDetailsDtoImpl(
      orderValue: (json['OrderValue'] as num?)?.toDouble() ?? 0.0,
      totalTax: (json['TotalTax'] as num?)?.toDouble() ?? 0,
      deliveryFee: (json['DeliveryFee'] as num?)?.toDouble() ?? 0,
      manualFee: (json['ManualFee'] as num?)?.toDouble() ?? 0,
      totalValue: (json['TotalValue'] as num?)?.toDouble() ?? 0,
      totalDiscount: (json['TotalDiscount'] as num?)?.toDouble() ?? 0,
      processingStatus: json['ProcessingStatus'] as String? ?? '',
      requestedDeliveryDate: json['RequestedDeliveryDate'] as String? ?? '',
      expectedDeliveryDate: json['ExpectedDeliveryDate'] as String? ?? '',
      type: json['Type'] as String? ?? '',
      telephoneNumber: json['TelephoneNumber'] as String? ?? '',
      createdDate: _createdDateTimeReadValue(json, 'createdDate') as String,
      eZRXNumber: json['EZRXNumber'] as String? ?? '',
      orderBy: json['OrderBy'] as String? ?? '',
      referenceNotes: json['ReferenceNotes'] as String? ?? '',
      companyName: json['CompanyName'] as String? ?? '',
      orderNumber: json['OrderNumber'] as String? ?? '',
      pOReference: json['POReference'] as String? ?? '',
      shipTo: json['ShipTo'] as String? ?? '',
      soldTo: json['SoldTo'] as String? ?? '',
      shipToAddress: json['ShipToAddres'] as String? ?? '',
      soldToAddress: json['SoldToAddress'] as String? ?? '',
      invoiceNumber: json['InvoiceNumber'] as String? ?? '',
      orderReason: json['OrderReason'] as String? ?? '',
      orderHistoryDetailsOrderItem:
          (orderItemOverride(json, 'OrderItems') as List<dynamic>)
              .map((e) => OrderHistoryDetailsOrderItemDto.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      orderHistoryDetailsPaymentTerm:
          OrderHistoryDetailsPaymentTermDto.fromJson(
              paymentTermOverride(json, 'PaymentTerm') as Map<String, dynamic>),
      orderHistoryDetailsSpecialInstructions:
          specialInstructionOverride(json, 'SpecialInstructions') as String,
      orderHistoryDetailsPoDocuments:
          (poDocumentOverride(json, 'PODocuments') as List<dynamic>)
              .map((e) => PoDocumentsDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      itemCount: (json['ItmCount'] as num?)?.toInt() ?? 0,
      isMarketPlace:
          mappingIsMarketPlace(json, 'isMarketPlace') as bool? ?? false,
      taxRate: (handleTax(json, 'TaxRate') as num).toDouble(),
    );

Map<String, dynamic> _$$OrderHistoryDetailsDtoImplToJson(
        _$OrderHistoryDetailsDtoImpl instance) =>
    <String, dynamic>{
      'OrderValue': instance.orderValue,
      'TotalTax': instance.totalTax,
      'DeliveryFee': instance.deliveryFee,
      'ManualFee': instance.manualFee,
      'TotalValue': instance.totalValue,
      'TotalDiscount': instance.totalDiscount,
      'ProcessingStatus': instance.processingStatus,
      'RequestedDeliveryDate': instance.requestedDeliveryDate,
      'ExpectedDeliveryDate': instance.expectedDeliveryDate,
      'Type': instance.type,
      'TelephoneNumber': instance.telephoneNumber,
      'createdDate': instance.createdDate,
      'EZRXNumber': instance.eZRXNumber,
      'OrderBy': instance.orderBy,
      'ReferenceNotes': instance.referenceNotes,
      'CompanyName': instance.companyName,
      'OrderNumber': instance.orderNumber,
      'POReference': instance.pOReference,
      'ShipTo': instance.shipTo,
      'SoldTo': instance.soldTo,
      'ShipToAddres': instance.shipToAddress,
      'SoldToAddress': instance.soldToAddress,
      'InvoiceNumber': instance.invoiceNumber,
      'OrderReason': instance.orderReason,
      'OrderItems':
          instance.orderHistoryDetailsOrderItem.map((e) => e.toJson()).toList(),
      'PaymentTerm': instance.orderHistoryDetailsPaymentTerm.toJson(),
      'SpecialInstructions': instance.orderHistoryDetailsSpecialInstructions,
      'PODocuments': instance.orderHistoryDetailsPoDocuments
          .map((e) => e.toJson())
          .toList(),
      'ItmCount': instance.itemCount,
      'isMarketPlace': instance.isMarketPlace,
      'TaxRate': instance.taxRate,
    };
