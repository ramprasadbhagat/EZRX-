import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_item.freezed.dart';

@freezed
class PaymentItem with _$PaymentItem {
  const PaymentItem._();

  const factory PaymentItem({
    required String searchKey,
    required String accountingDocumentItem,
    required DateTimeStringValue netDueDate,
    required DateTimeStringValue postingDate,
    required DateTimeStringValue documentDate,
    required String transactionCurrency,
    required double paymentAmountInDisplayCrcy,
    required String postingKeyName,
    required String documentReferenceID,
    required AmountDocumentType accountingDocumentType,
  }) = _PaymentItem;

  factory PaymentItem.empty() => PaymentItem(
        searchKey: '',
        accountingDocumentItem: '',
        netDueDate: DateTimeStringValue(''),
        postingDate: DateTimeStringValue(''),
        documentDate: DateTimeStringValue(''),
        transactionCurrency: '',
        paymentAmountInDisplayCrcy: 0.0,
        postingKeyName: '',
        documentReferenceID: '',
        accountingDocumentType: AmountDocumentType(''),
      );
}

extension PaymentItemListExtension on List<PaymentItem> {
  double get invoiceTotal {
    return List<PaymentItem>.from(this)
        .where((element) => element.accountingDocumentType.isInvoice)
        .map((item) => item.paymentAmountInDisplayCrcy)
        .fold(0.0, (result, amount) => result + amount);
  }

  double get creditTotal {
    return List<PaymentItem>.from(this)
        .where((element) => element.accountingDocumentType.isCredit)
        .map((item) => item.paymentAmountInDisplayCrcy)
        .fold(0.0, (result, amount) => result + amount);
  }

  double get totalInInvoice => List<PaymentItem>.from(this).fold(
        0,
        (previousValue, element) =>
            previousValue + element.paymentAmountInDisplayCrcy,
      );
}
