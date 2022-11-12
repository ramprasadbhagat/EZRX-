// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_shipping_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryDetailsShippingInformationDto
    _$$_OrderHistoryDetailsShippingInformationDtoFromJson(
            Map<String, dynamic> json) =>
        _$_OrderHistoryDetailsShippingInformationDto(
          address: json['Address'] as String? ?? '',
          pOReference: json['POReference'] as String? ?? '',
          invoiceNumber: json['InvoiceNumber'] as String? ?? '',
          invoiceDate: json['InvoiceDate'] as String? ?? '',
          postalCode: json['PostalCode'] as String? ?? '',
          country: json['Country'] as String? ?? '',
          phone: json['Phone'] as String? ?? '',
          fax: json['Fax'] as String? ?? '',
          invoices: (json['Invoices'] as List<dynamic>?)
                  ?.map((e) => OrderHistoryDetailsInvoicesDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$$_OrderHistoryDetailsShippingInformationDtoToJson(
        _$_OrderHistoryDetailsShippingInformationDto instance) =>
    <String, dynamic>{
      'Address': instance.address,
      'POReference': instance.pOReference,
      'InvoiceNumber': instance.invoiceNumber,
      'InvoiceDate': instance.invoiceDate,
      'PostalCode': instance.postalCode,
      'Country': instance.country,
      'Phone': instance.phone,
      'Fax': instance.fax,
      'Invoices': instance.invoices,
    };
