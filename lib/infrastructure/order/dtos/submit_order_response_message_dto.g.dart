// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_order_response_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubmitOrderResponseMessageDto _$$_SubmitOrderResponseMessageDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SubmitOrderResponseMessageDto(
      type: json['Type'] as String? ?? '',
      message: json['Message'] as String? ?? '',
    );

Map<String, dynamic> _$$_SubmitOrderResponseMessageDtoToJson(
        _$_SubmitOrderResponseMessageDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Message': instance.message,
    };
