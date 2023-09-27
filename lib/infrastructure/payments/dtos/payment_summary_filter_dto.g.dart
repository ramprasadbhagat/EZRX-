// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_summary_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentSummaryFilterDto _$$_PaymentSummaryFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentSummaryFilterDto(
      createdDateFrom: json['createdDateFrom'] as String? ?? '',
      createdDateTo: json['createdDateTo'] as String? ?? '',
      amountValueFrom: json['amountValueFrom'] as String? ?? '',
      amountValueTo: json['amountValueTo'] as String? ?? '',
      filterStatuses: json['filterStatuses'] as String? ?? '',
    );

Map<String, dynamic> _$$_PaymentSummaryFilterDtoToJson(
        _$_PaymentSummaryFilterDto instance) =>
    <String, dynamic>{
      'createdDateFrom': instance.createdDateFrom,
      'createdDateTo': instance.createdDateTo,
      'amountValueFrom': instance.amountValueFrom,
      'amountValueTo': instance.amountValueTo,
      'filterStatuses': instance.filterStatuses,
    };
