// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_invoice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerInvoiceDto _$$_CustomerInvoiceDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerInvoiceDto(
      accountingDocExternalReference:
          json['accountingDocExternalReference'] as String? ?? '',
      accountingDocument: json['accountingDocument'] as String? ?? '',
      bpCustomerNumber: json['bpCustomerNumber'] as String,
      debitCreditFlag: json['debitCreditFlag'] as String? ?? '',
      discountAmount: json['discountAmount'] as String? ?? '',
      discountDate: json['discountDate'] as String? ?? '',
      displayAmount: json['displayAmount'] as String? ?? '',
      displayCurrency: json['displayCurrency'] as String? ?? '',
      displayOpenAmount: json['displayOpenAmount'] as String? ?? '',
      dueDate: json['dueDate'] as String? ?? '',
      fiscalYear: json['fiscalYear'] as String? ?? '',
      isDisputed: json['isDisputed'] as String? ?? '',
      lineItemNumber: json['lineItemNumber'] as String? ?? '',
      lineNumber: json['lineNumber'] as String? ?? '',
      partialPaymentHistoryDesc:
          json['partialPaymentHistoryDesc'] as String? ?? '',
      paymentAmount: json['paymentAmount'] as String? ?? '',
      salesOrg: json['salesOrg'] as String? ?? '',
      zzDeductCode: (json['zzDeductCode'] as List<dynamic>?)
              ?.map((e) =>
                  PaymentDeductionDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_CustomerInvoiceDtoToJson(
        _$_CustomerInvoiceDto instance) =>
    <String, dynamic>{
      'accountingDocExternalReference': instance.accountingDocExternalReference,
      'accountingDocument': instance.accountingDocument,
      'bpCustomerNumber': instance.bpCustomerNumber,
      'debitCreditFlag': instance.debitCreditFlag,
      'discountAmount': instance.discountAmount,
      'discountDate': instance.discountDate,
      'displayAmount': instance.displayAmount,
      'displayCurrency': instance.displayCurrency,
      'displayOpenAmount': instance.displayOpenAmount,
      'dueDate': instance.dueDate,
      'fiscalYear': instance.fiscalYear,
      'isDisputed': instance.isDisputed,
      'lineItemNumber': instance.lineItemNumber,
      'lineNumber': instance.lineNumber,
      'partialPaymentHistoryDesc': instance.partialPaymentHistoryDesc,
      'paymentAmount': instance.paymentAmount,
      'salesOrg': instance.salesOrg,
      'zzDeductCode': instance.zzDeductCode.map((e) => e.toJson()).toList(),
    };

_$_PaymentDeductionDto _$$_PaymentDeductionDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentDeductionDto(
      deductCode: json['deductCode'] as String? ?? '',
      amountInTransactionCurrency:
          (json['amountInTransactionCurrency'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_PaymentDeductionDtoToJson(
        _$_PaymentDeductionDto instance) =>
    <String, dynamic>{
      'deductCode': instance.deductCode,
      'amountInTransactionCurrency': instance.amountInTransactionCurrency,
    };
