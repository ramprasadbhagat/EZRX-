// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_order_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubmitOrderResponseDto _$$_SubmitOrderResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SubmitOrderResponseDto(
      salesDocument: json['SalesDocument'] as String? ?? '',
      messages: (json['Messages'] as List<dynamic>?)
              ?.map((e) => SubmitOrderResponseMessageDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_SubmitOrderResponseDtoToJson(
        _$_SubmitOrderResponseDto instance) =>
    <String, dynamic>{
      'SalesDocument': instance.salesDocument,
      'Messages': instance.messages,
    };
