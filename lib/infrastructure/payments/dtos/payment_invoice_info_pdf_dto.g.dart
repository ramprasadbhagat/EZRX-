// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_invoice_info_pdf_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentInvoiceInfoPdfDto _$$_PaymentInvoiceInfoPdfDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentInvoiceInfoPdfDto(
      valueDate: json['valueDate'] as String? ?? '',
      paymentID: json['paymentID'] as String? ?? '',
      zzAdvice: json['zzAdvice'] as String? ?? '',
      paymentDue: json['paymentDue'] as String? ?? '',
      paymentMethod: json['paymentMethod'] as String? ?? '',
      customerName: json['customerName'] as String? ?? '',
      payer: json['payer'] as String? ?? '',
      beneficiaryName: json['beneficiaryName'] as String? ?? '',
      bankName: json['bankName'] as String? ?? '',
      branch: json['branch'] as String? ?? '',
      bankCode: json['bankCode'] as String? ?? '',
      bankAccount: json['bankAccount'] as String? ?? '',
      hdbcSwiftCode: json['hdbcSwiftCode'] as String? ?? '',
      bankAddress: json['bankAddress'] as String? ?? '',
      payNowUen: json['payNowUen'] as String? ?? '',
      emailId: json['emailId'] as String? ?? '',
      qrCode: json['qrCode'] as String? ?? '',
      paymentBatchAdditionalInfo:
          json['paymentBatchAdditionalInfo'] as String? ?? '',
      paymentItems: (json['paymentItems'] as List<dynamic>?)
              ?.map((e) => PaymentItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      salesDistrict: json['salesDistrict'] as String? ?? '',
      footer: json['footer'] as String? ?? '',
      headerLogoPath: json['headerLogoPath'] as String? ?? '',
      pleaseNote: json['pleaseNote'] as String? ?? '',
      header: json['header'] as String? ?? '',
    );

Map<String, dynamic> _$$_PaymentInvoiceInfoPdfDtoToJson(
        _$_PaymentInvoiceInfoPdfDto instance) =>
    <String, dynamic>{
      'valueDate': instance.valueDate,
      'paymentID': instance.paymentID,
      'zzAdvice': instance.zzAdvice,
      'paymentDue': instance.paymentDue,
      'paymentMethod': instance.paymentMethod,
      'customerName': instance.customerName,
      'payer': instance.payer,
      'beneficiaryName': instance.beneficiaryName,
      'bankName': instance.bankName,
      'branch': instance.branch,
      'bankCode': instance.bankCode,
      'bankAccount': instance.bankAccount,
      'hdbcSwiftCode': instance.hdbcSwiftCode,
      'bankAddress': instance.bankAddress,
      'payNowUen': instance.payNowUen,
      'emailId': instance.emailId,
      'qrCode': instance.qrCode,
      'paymentBatchAdditionalInfo': instance.paymentBatchAdditionalInfo,
      'paymentItems': instance.paymentItems.map((e) => e.toJson()).toList(),
      'salesDistrict': instance.salesDistrict,
      'footer': instance.footer,
      'headerLogoPath': instance.headerLogoPath,
      'pleaseNote': instance.pleaseNote,
      'header': instance.header,
    };
