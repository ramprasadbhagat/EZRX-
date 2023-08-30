import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_open_item.freezed.dart';

@freezed
class CustomerOpenItem with _$CustomerOpenItem {
  const CustomerOpenItem._();
  factory CustomerOpenItem({
    required StatusType status,
    required String accountingDocument,
    required DateTimeStringValue netDueDate,
    required double amountInTransactionCurrency,
    required String documentReferenceID,
    required String postingKeyName,
    required String transactionCurrency,
    required String accountingDocExternalReference,
    required String bpCustomerNumber,
    required String debitCreditCode,
    required double cashDiscountAmountInDspCrcy,
    required DateTimeStringValue cashDiscountDueDate,
    required double totalAmountInDisplayCrcy,
    required String displayCurrency,
    required double openAmountInDisplayCrcy,
    required String fiscalYear,
    required String isDisputed,
    required String accountingDocumentItem,
    required String accountingDocumentItemRef,
    required String partialPaymentHistoryDesc,
    required double paymentAmountInDisplayCrcy,
    required String companyCode,
  }) = _CustomerOpenItem;

  factory CustomerOpenItem.empty() => CustomerOpenItem(
        status: StatusType(''),
        amountInTransactionCurrency: 0.0,
        accountingDocument: '',
        postingKeyName: '',
        transactionCurrency: '',
        netDueDate: DateTimeStringValue(''),
        documentReferenceID: '',
        accountingDocExternalReference: '',
        bpCustomerNumber: '',
        debitCreditCode: '',
        cashDiscountAmountInDspCrcy: 0,
        cashDiscountDueDate: DateTimeStringValue(''),
        totalAmountInDisplayCrcy: 0,
        displayCurrency: '',
        openAmountInDisplayCrcy: 0,
        fiscalYear: '',
        isDisputed: '',
        accountingDocumentItem: '',
        accountingDocumentItemRef: '',
        partialPaymentHistoryDesc: '',
        paymentAmountInDisplayCrcy: 0,
        companyCode: '',
      );
}

extension CustomerOpenItemListExtension on List<CustomerOpenItem> {
  double get amountTotal =>
      fold<double>(0, (sum, item) => sum + item.amountInTransactionCurrency);

  bool isEqual(List<CustomerOpenItem> list) {
    final set1 = Set<CustomerOpenItem>.from(list);
    final set2 = Set<CustomerOpenItem>.from(this);

    return set1.containsAll(set2) && set2.containsAll(set1);
  }
}
