import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_and_invoice_item.freezed.dart';

@freezed
class CreditAndInvoiceItem with _$CreditAndInvoiceItem {
  const CreditAndInvoiceItem._();
  factory CreditAndInvoiceItem({
    required String bpCustomerNumber,
    required String accountingDocument,
    required String accountingDocumentType,
    required String fiscalYear,
    required String accountingDocumentItem,
    required String postingKeyName,
    required DateTimeStringValue netDueDate,
    required DateTimeStringValue postingDate,
    required StringValue referenceDocumentNumber,
    required StatusType invoiceProcessingStatus,
    required int grossAmount,
    required int netAmount,
    required int taxAmount,
    required DateTimeStringValue documentDate,
    required double amountInTransactionCurrency,
    required StringValue invoiceReference,
    required String returnId,
    required StringValue orderId,
  }) = _CreditAndInvoiceItem;

  factory CreditAndInvoiceItem.empty() => CreditAndInvoiceItem(
        bpCustomerNumber: '',
        accountingDocument: '',
        accountingDocumentType: '',
        fiscalYear: '',
        netDueDate: DateTimeStringValue(''),
        accountingDocumentItem: '',
        postingKeyName: '',
        documentDate: DateTimeStringValue(''),
        postingDate: DateTimeStringValue(''),
        referenceDocumentNumber: StringValue(''),
        invoiceProcessingStatus: StatusType(''),
        grossAmount: 0,
        netAmount: 0,
        taxAmount: 0,
        amountInTransactionCurrency: 0.0,
        invoiceReference: StringValue(''),
        returnId: '',
        orderId: StringValue(''),
      );
//to convert if amountInTransactionCurrency value is negative
  double get convertIfAmountInTransactionCurrencyIsNegative =>
      amountInTransactionCurrency * -1;
}

extension CreditAndInvoiceListExtension on List<CreditAndInvoiceItem> {
  List<CreditAndInvoiceGroup> get groupList {
    return List<CreditAndInvoiceItem>.from(this)
        .groupListsBy((item) => item.postingDate)
        .entries
        .map(
          (entry) => CreditAndInvoiceGroup(
            dueDate: entry.key,
            items: entry.value,
          ),
        )
        .toList();
  }
}