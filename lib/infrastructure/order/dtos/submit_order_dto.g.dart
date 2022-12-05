// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubmitOrderDto _$$_SubmitOrderDtoFromJson(Map<String, dynamic> json) =>
    _$_SubmitOrderDto(
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
      specialInstructions: json['specialInstructions'] as String? ?? '',
      purchaseOrderType: json['PurchaseOrderType'] as String? ?? '',
      orderType: json['orderType'] as String? ?? '',
      orderReason: json['orderReason'] as String? ?? '',
      shippingCondition: json['shippingCondition'] as String? ?? '',
      telephone: json['telephone'] as String? ?? '',
      referenceNotes: json['referenceNotes'] as String? ?? '',
      paymentTerms: json['paymentTerms'] as String? ?? '',
      collectiveNumber: json['collectiveNumber'] as String? ?? '',
      subscribeStatusChange: json['subscribeStatusChange'] as bool? ?? false,
      trackingLevel: json['trackingLevel'] as String? ?? '',
      blockOrder: json['blockOrder'] as bool? ?? false,
    );

Map<String, dynamic> _$$_SubmitOrderDtoToJson(_$_SubmitOrderDto instance) =>
    <String, dynamic>{
      'username': instance.userName,
      'companyName': instance.companyName,
      'customer': instance.customer,
      'POReference': instance.poReference,
      'materials': instance.materials,
      'PODate': instance.poDate,
      'RequestedDeliveryDate': instance.requestedDeliveryDate,
      'specialInstructions': instance.specialInstructions,
      'PurchaseOrderType': instance.purchaseOrderType,
      'orderType': instance.orderType,
      'orderReason': instance.orderReason,
      'shippingCondition': instance.shippingCondition,
      'telephone': instance.telephone,
      'referenceNotes': instance.referenceNotes,
      'paymentTerms': instance.paymentTerms,
      'collectiveNumber': instance.collectiveNumber,
      'subscribeStatusChange': instance.subscribeStatusChange,
      'trackingLevel': instance.trackingLevel,
      'blockOrder': instance.blockOrder,
    };
