// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_and_invoice_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreditAndInvoiceItemDto _$$_CreditAndInvoiceItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CreditAndInvoiceItemDto(
      bpCustomerNumber: json['bpCustomerNumber'] as String? ?? '',
      accountingDocument: json['accountingDocument'] as String? ?? '',
      accountingDocumentType: json['accountingDocumentType'] as String? ?? '',
      fiscalYear: json['fiscalYear'] as String? ?? '',
      accountingDocumentItem: json['accountingDocumentItem'] as String? ?? '',
      postingKeyName: json['postingKeyName'] as String? ?? '',
      netDueDate: json['netDueDate'] as String? ?? '',
      postingDate: json['postingDate'] as String? ?? '',
      transactionCurrency: json['transactionCurrency'] as String? ?? '',
      referenceDocumentNumber: json['referenceDocumentNumber'] as String? ?? '',
      invoiceProcessingStatus: json['invoiceProcessingStatus'] as String? ?? '',
      grossAmount: json['grossAmount'] as int? ?? 0,
      netAmount: json['netAmount'] as int? ?? 0,
      taxAmount: json['taxAmount'] as int? ?? 0,
      amountInTransactionCurrency:
          (json['amountInTransactionCurrency'] as num?)?.toDouble() ?? 0.0,
      invoiceReference: json['invoiceReference'] as String? ?? '',
      returnId: json['returnId'] as String? ?? '',
      orderId: json['orderId'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_CreditAndInvoiceItemDtoToJson(
        _$_CreditAndInvoiceItemDto instance) =>
    <String, dynamic>{
      'bpCustomerNumber': instance.bpCustomerNumber,
      'accountingDocument': instance.accountingDocument,
      'accountingDocumentType': instance.accountingDocumentType,
      'fiscalYear': instance.fiscalYear,
      'accountingDocumentItem': instance.accountingDocumentItem,
      'postingKeyName': instance.postingKeyName,
      'netDueDate': instance.netDueDate,
      'postingDate': instance.postingDate,
      'transactionCurrency': instance.transactionCurrency,
      'referenceDocumentNumber': instance.referenceDocumentNumber,
      'invoiceProcessingStatus': instance.invoiceProcessingStatus,
      'grossAmount': instance.grossAmount,
      'netAmount': instance.netAmount,
      'taxAmount': instance.taxAmount,
      'amountInTransactionCurrency': instance.amountInTransactionCurrency,
      'invoiceReference': instance.invoiceReference,
      'returnId': instance.returnId,
      'orderId': instance.orderId,
      'principalName': instance.principalName,
      'principalCode': instance.principalCode,
    };
