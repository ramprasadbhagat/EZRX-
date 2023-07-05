// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_by_item_return_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViewByItemReturnFilterDto _$$_ViewByItemReturnFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ViewByItemReturnFilterDto(
      dateFrom: json['dateFrom'] as String? ?? '',
      dateTo: json['dateTo'] as String? ?? '',
      refundTotalFrom: json['refundTotalFrom'] as String? ?? '',
      refundTotalTo: json['refundTotalTo'] as String? ?? '',
      statusList: (json['status'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ViewByItemReturnFilterDtoToJson(
        _$_ViewByItemReturnFilterDto instance) =>
    <String, dynamic>{
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'refundTotalFrom': instance.refundTotalFrom,
      'refundTotalTo': instance.refundTotalTo,
      'status': instance.statusList,
    };
