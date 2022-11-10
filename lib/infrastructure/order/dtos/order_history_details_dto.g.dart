// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryDetailsDto _$$_OrderHistoryDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderHistoryDetailsDto(
      orderHistoryDetailsOrderHeader:
          OrderHistoryDetailsOrderHeadersDto.fromJson(
              json['OrderHeader'] as Map<String, dynamic>),
      orderHistoryDetailsShippingInformation:
          OrderHistoryDetailsShippingInformationDto.fromJson(
              json['ShippingInformation'] as Map<String, dynamic>),
      orderHistoryDetailsOrderItem: (json['OrderItems'] as List<dynamic>)
          .map((e) => OrderHistoryDetailsOrderItemDto.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      orderHistoryDetailsPaymentTerm:
          OrderHistoryDetailsPaymentTermDto.fromJson(
              json['PaymentTerm'] as Map<String, dynamic>),
      orderHistoryDetailsSpecialInstructions:
          json['SpecialInstructions'] as String,
      orderHistoryDetailsPoDocuments: (json['PODocuments'] as List<dynamic>)
          .map((e) => OrderHistoryDetailsPODocumentsDto.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      orderHistoryDetailsMessages: (json['Messages'] as List<dynamic>)
          .map((e) => OrderHistoryDetailsMessagesDto.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderHistoryDetailsDtoToJson(
        _$_OrderHistoryDetailsDto instance) =>
    <String, dynamic>{
      'OrderHeader': instance.orderHistoryDetailsOrderHeader,
      'ShippingInformation': instance.orderHistoryDetailsShippingInformation,
      'OrderItems': instance.orderHistoryDetailsOrderItem,
      'PaymentTerm': instance.orderHistoryDetailsPaymentTerm,
      'SpecialInstructions': instance.orderHistoryDetailsSpecialInstructions,
      'PODocuments': instance.orderHistoryDetailsPoDocuments,
      'Messages': instance.orderHistoryDetailsMessages,
    };
