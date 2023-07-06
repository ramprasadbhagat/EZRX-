// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_and_invoice_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreditAndInvoiceItemDto _$$_CreditAndInvoiceItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CreditAndInvoiceItemDto(
      bpCustomerNumber: json['bpCustomerNumber'] as String? ?? '',
      fiscalYear: json['fiscalYear'] as String? ?? '',
      accountingDocument: json['accountingDocument'] as String? ?? '',
      accountingDocumentItem: json['accountingDocumentItem'] as String? ?? '',
      accountingDocumentType: json['accountingDocumentType'] as String? ?? '',
      postingKeyName: json['postingKeyName'] as String? ?? '',
      netDueDate: json['netDueDate'] as String? ?? '',
      postingDate: json['postingDate'] as String? ?? '',
      referenceDocumentNumber: json['referenceDocumentNumber'] as String? ?? '',
      documentDate: json['documentDate'] as String? ?? '',
      amountInTransactionCurrency:
          (json['amountInTransactionCurrency'] as num?)?.toDouble() ?? 0.0,
      invoiceReference: json['invoiceReference'] as String? ?? '',
      invoiceProcessingStatus: json['invoiceProcessingStatus'] as String? ?? '',
      orderId: json['orderId'] as String? ?? '',
    );

Map<String, dynamic> _$$_CreditAndInvoiceItemDtoToJson(
        _$_CreditAndInvoiceItemDto instance) =>
    <String, dynamic>{
      'bpCustomerNumber': instance.bpCustomerNumber,
      'fiscalYear': instance.fiscalYear,
      'accountingDocument': instance.accountingDocument,
      'accountingDocumentItem': instance.accountingDocumentItem,
      'accountingDocumentType': instance.accountingDocumentType,
      'postingKeyName': instance.postingKeyName,
      'netDueDate': instance.netDueDate,
      'postingDate': instance.postingDate,
      'referenceDocumentNumber': instance.referenceDocumentNumber,
      'documentDate': instance.documentDate,
      'amountInTransactionCurrency': instance.amountInTransactionCurrency,
      'invoiceReference': instance.invoiceReference,
      'invoiceProcessingStatus': instance.invoiceProcessingStatus,
      'orderId': instance.orderId,
    };
