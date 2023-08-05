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
    required String fiscalYear,
    required String searchKey,
    required String accountingDocumentItem,
    required String accountingDocumentType,
    required String postingKeyName,
    required DateTimeStringValue netDueDate,
    required DateTimeStringValue postingDate,
    required StringValue referenceDocumentNumber,
    required DateTimeStringValue documentDate,
    required double amountInTransactionCurrency,
    required StringValue invoiceReference,
    required StatusType invoiceProcessingStatus,
    required StringValue orderId,
  }) = _CreditAndInvoiceItem;

  factory CreditAndInvoiceItem.empty() => CreditAndInvoiceItem(
        bpCustomerNumber: '',
        fiscalYear: '',
        searchKey: '',
        accountingDocumentItem: '',
        accountingDocumentType: '',
        postingKeyName: '',
        netDueDate: DateTimeStringValue(''),
        postingDate: DateTimeStringValue(''),
        referenceDocumentNumber: StringValue(''),
        documentDate: DateTimeStringValue(''),
        amountInTransactionCurrency: 0.0,
        invoiceReference: StringValue(''),
        invoiceProcessingStatus: StatusType(''),
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
