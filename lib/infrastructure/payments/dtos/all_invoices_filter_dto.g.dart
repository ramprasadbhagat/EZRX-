// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_invoices_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllInvoicesFilterDto _$$_AllInvoicesFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AllInvoicesFilterDto(
      dueDateFrom: json['dueDateFrom'] as String? ?? '',
      dueDateTo: json['dueDateTo'] as String? ?? '',
      documentNumber: json['documentNumber'] as String,
      documentDateFrom: json['documentDateFrom'] as String? ?? '',
      documentDateTo: json['documentDateTo'] as String? ?? '',
      amountValueFrom: json['amountValueFrom'] as String? ?? '',
      amountValueTo: json['amountValueTo'] as String? ?? '',
      filterStatuses: json['filterStatuses'] as String? ?? '',
    );

Map<String, dynamic> _$$_AllInvoicesFilterDtoToJson(
        _$_AllInvoicesFilterDto instance) =>
    <String, dynamic>{
      'dueDateFrom': instance.dueDateFrom,
      'dueDateTo': instance.dueDateTo,
      'documentNumber': instance.documentNumber,
      'documentDateFrom': instance.documentDateFrom,
      'documentDateTo': instance.documentDateTo,
      'amountValueFrom': instance.amountValueFrom,
      'amountValueTo': instance.amountValueTo,
      'filterStatuses': instance.filterStatuses,
    };
