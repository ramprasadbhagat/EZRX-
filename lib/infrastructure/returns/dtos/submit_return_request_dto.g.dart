// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_return_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubmitReturnRequestDto _$$_SubmitReturnRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SubmitReturnRequestDto(
      customerCode: json['soldToCustomer'] as String? ?? '',
      username: json['username'] as String? ?? '',
      orderSource: json['orderSource'] as String? ?? '',
      subscribeStatusChange: json['subscribeStatusChange'] as bool? ?? false,
      specialInstruction: json['specialInstruction'] as String,
      purchaseNumberC: json['purchaseNumberC'] as String? ?? '',
      invoiceDetails: (json['invoiceDetails'] as List<dynamic>?)
              ?.map(
                  (e) => InvoiceDetailsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_SubmitReturnRequestDtoToJson(
        _$_SubmitReturnRequestDto instance) =>
    <String, dynamic>{
      'soldToCustomer': instance.customerCode,
      'username': instance.username,
      'orderSource': instance.orderSource,
      'subscribeStatusChange': instance.subscribeStatusChange,
      'specialInstruction': instance.specialInstruction,
      'purchaseNumberC': instance.purchaseNumberC,
      'invoiceDetails': instance.invoiceDetails.map((e) => e.toJson()).toList(),
    };
