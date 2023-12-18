// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_tracker_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderStatusTrackerDto _$$_OrderStatusTrackerDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderStatusTrackerDto(
      action: json['Actiom'] as String? ?? '',
      stepName: json['StepName'] as String? ?? '',
      stepStage: json['StepStape'] as String,
      state: json['State'] as String? ?? '',
      status: json['Status'] as String? ?? '',
      updateTimeStamp: json['UpdateTimeStamp'] as String? ?? '',
      preformedAt: json['PreformedAt'] as String? ?? '',
    );

Map<String, dynamic> _$$_OrderStatusTrackerDtoToJson(
        _$_OrderStatusTrackerDto instance) =>
    <String, dynamic>{
      'Actiom': instance.action,
      'StepName': instance.stepName,
      'StepStape': instance.stepStage,
      'State': instance.state,
      'Status': instance.status,
      'UpdateTimeStamp': instance.updateTimeStamp,
      'PreformedAt': instance.preformedAt,
    };
