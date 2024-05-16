// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmitOrderDtoImpl _$$SubmitOrderDtoImplFromJson(Map<String, dynamic> json) =>
    _$SubmitOrderDtoImpl(
      userName: json['username'] as String? ?? '',
      companyName: json['companyName'] as String? ?? '',
      customer: SubmitOrderCustomerDto.fromJson(
          json['customer'] as Map<String, dynamic>),
      poReference: json['POReference'] as String? ?? '',
      materials: (json['materials'] as List<dynamic>?)
              ?.map((e) =>
                  SubmitMaterialInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      poDate: json['PODate'] as String? ?? '',
      requestedDeliveryDate: json['RequestedDeliveryDate'] as String? ?? '',
      specialInstructions: json['SpecialInstructions'] as String? ?? '',
      orderValue: (json['orderValue'] as num?)?.toDouble() ?? 0,
      totalTax: (json['totalTax'] as num?)?.toDouble() ?? 0,
      telephone: json['Telephone'] as String? ?? '',
      referenceNotes: json['referenceNotes'] as String? ?? '',
      paymentTerms: json['paymentTerms'] as String? ?? '',
      collectiveNumber: json['CollectiveNumber'] as String? ?? '',
      blockOrder: json['blockOrder'] as bool? ?? false,
      language: json['language'] as String? ?? 'EN',
      paymentMethod: json['paymentMethod'] as String? ?? 'Bank Transfer',
      purchaseOrderType: json['PurchaseOrderType'] as String? ?? '',
      poDocuments: (json['poDocuments'] as List<dynamic>?)
              ?.map((e) => PoDocumentsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$SubmitOrderDtoImplToJson(
        _$SubmitOrderDtoImpl instance) =>
    <String, dynamic>{
      'username': instance.userName,
      'companyName': instance.companyName,
      'customer': instance.customer.toJson(),
      'POReference': instance.poReference,
      'materials': instance.materials.map((e) => e.toJson()).toList(),
      'PODate': instance.poDate,
      'RequestedDeliveryDate': instance.requestedDeliveryDate,
      'SpecialInstructions': instance.specialInstructions,
      'orderValue': instance.orderValue,
      'totalTax': instance.totalTax,
      'Telephone': instance.telephone,
      'referenceNotes': instance.referenceNotes,
      'paymentTerms': instance.paymentTerms,
      'CollectiveNumber': instance.collectiveNumber,
      'blockOrder': instance.blockOrder,
      'language': instance.language,
      'paymentMethod': instance.paymentMethod,
      'PurchaseOrderType': instance.purchaseOrderType,
      'poDocuments': instance.poDocuments.map((e) => e.toJson()).toList(),
    };
