// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvoiceDetailsDto _$$_InvoiceDetailsDtoFromJson(Map<String, dynamic> json) =>
    _$_InvoiceDetailsDto(
      invoiceNumber: json['invoiceNumber'] as String? ?? '',
      salesOrg: json['salesOrg'] as String? ?? '',
      materials: (json['materials'] as List<dynamic>?)
              ?.map((e) =>
                  ReturnItemDetailsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_InvoiceDetailsDtoToJson(
        _$_InvoiceDetailsDto instance) =>
    <String, dynamic>{
      'invoiceNumber': instance.invoiceNumber,
      'salesOrg': instance.salesOrg,
      'materials': instance.materials.map((e) => e.toJson()).toList(),
    };
