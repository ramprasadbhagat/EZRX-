// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_credits_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllCreditsFilterDto _$$_AllCreditsFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AllCreditsFilterDto(
      documentNumber: json['documentNumber'] as String? ?? '',
      creditAmountTo: json['creditAmountTo'] as String? ?? '',
      creditAmountFrom: json['creditAmountFrom'] as String? ?? '',
      documentDateTo: json['documentDateTo'] as String? ?? '',
      documentDateFrom: json['documentDateFrom'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$_AllCreditsFilterDtoToJson(
        _$_AllCreditsFilterDto instance) =>
    <String, dynamic>{
      'documentNumber': instance.documentNumber,
      'creditAmountTo': instance.creditAmountTo,
      'creditAmountFrom': instance.creditAmountFrom,
      'documentDateTo': instance.documentDateTo,
      'documentDateFrom': instance.documentDateFrom,
      'status': instance.status,
    };
