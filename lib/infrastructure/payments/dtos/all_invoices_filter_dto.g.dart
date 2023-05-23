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
      debitValueFrom: json['debitValueFrom'] as String? ?? '',
      debitValueTo: json['debitValueTo'] as String? ?? '',
      filterStatus: json['filterStatus'] as String? ?? '',
    );

Map<String, dynamic> _$$_AllInvoicesFilterDtoToJson(
        _$_AllInvoicesFilterDto instance) =>
    <String, dynamic>{
      'dueDateFrom': instance.dueDateFrom,
      'dueDateTo': instance.dueDateTo,
      'documentNumber': instance.documentNumber,
      'documentDateFrom': instance.documentDateFrom,
      'documentDateTo': instance.documentDateTo,
      'debitValueFrom': instance.debitValueFrom,
      'debitValueTo': instance.debitValueTo,
      'filterStatus': instance.filterStatus,
    };
