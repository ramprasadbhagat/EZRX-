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
              orderHeaderOverride(json, 'OrderHeader') as Map<String, dynamic>),
      orderHistoryDetailsShippingInformation:
          OrderHistoryDetailsShippingInformationDto.fromJson(
              shippingInformationOverride(json, 'ShippingInformation')
                  as Map<String, dynamic>),
      orderHistoryDetailsOrderItem: (json['OrderItems'] as List<dynamic>?)
              ?.map((e) => OrderHistoryDetailsOrderItemDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      orderHistoryDetailsPaymentTerm:
          OrderHistoryDetailsPaymentTermDto.fromJson(
              paymentTermOverride(json, 'PaymentTerm') as Map<String, dynamic>),
      orderHistoryDetailsSpecialInstructions:
          json['SpecialInstructions'] as String? ?? '',
      orderHistoryDetailsPoDocuments: (json['PODocuments'] as List<dynamic>?)
              ?.map((e) => OrderHistoryDetailsPODocumentsDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      orderHistoryDetailsMessages: (json['Messages'] as List<dynamic>?)
              ?.map((e) => OrderHistoryDetailsMessagesDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_OrderHistoryDetailsDtoToJson(
        _$_OrderHistoryDetailsDto instance) =>
    <String, dynamic>{
      'OrderHeader': instance.orderHistoryDetailsOrderHeader.toJson(),
      'ShippingInformation':
          instance.orderHistoryDetailsShippingInformation.toJson(),
      'OrderItems':
          instance.orderHistoryDetailsOrderItem.map((e) => e.toJson()).toList(),
      'PaymentTerm': instance.orderHistoryDetailsPaymentTerm.toJson(),
      'SpecialInstructions': instance.orderHistoryDetailsSpecialInstructions,
      'PODocuments': instance.orderHistoryDetailsPoDocuments
          .map((e) => e.toJson())
          .toList(),
      'Messages':
          instance.orderHistoryDetailsMessages.map((e) => e.toJson()).toList(),
    };
