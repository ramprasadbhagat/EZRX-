// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_messages_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryDetailsMessagesDto _$$_OrderHistoryDetailsMessagesDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderHistoryDetailsMessagesDto(
      type: json['Type'] as String? ?? '',
      message: json['Message'] as String? ?? '',
    );

Map<String, dynamic> _$$_OrderHistoryDetailsMessagesDtoToJson(
        _$_OrderHistoryDetailsMessagesDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Message': instance.message,
    };
