import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_group.dart';

part 'credit_and_invoice_item.freezed.dart';

@freezed
class CreditAndInvoiceItem with _$CreditAndInvoiceItem {
  const CreditAndInvoiceItem._();
  factory CreditAndInvoiceItem({
    required String bpCustomerNumber,
    required String fiscalYear,
    required StringValue searchKey,
    required String accountingDocumentItem,
    required String accountingDocumentType,
    required String postingKeyName,
    required DateTimeStringValue netDueDate,
    required DateTimeStringValue postingDate,
    required StringValue referenceDocumentNumber,
    required DateTimeStringValue documentDate,
    required double amountInTransactionCurrency,
    required double deliveryFee,
    required double discount,
    required double manualFee,
    required double taxAmount,
    required StringValue invoiceReference,
    required StatusType invoiceProcessingStatus,
    required StringValue orderId,
    @Default(true) isLoadingOrder,
  }) = _CreditAndInvoiceItem;

  factory CreditAndInvoiceItem.empty() => CreditAndInvoiceItem(
        bpCustomerNumber: '',
        fiscalYear: '',
        searchKey: StringValue(''),
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
        deliveryFee: 0.0,
        discount: 0.0,
        manualFee: 0.0,
        taxAmount: 0.0,
      );

//to convert if amountInTransactionCurrency value is negative
  double get convertIfAmountInTransactionCurrencyIsNegative =>
      amountInTransactionCurrency * -1;
  double get totalExcludeTax => amountInTransactionCurrency - taxAmount;
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
