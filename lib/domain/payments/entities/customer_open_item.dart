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
  }) = _CustomerOpenItem;

  factory CustomerOpenItem.empty() => CustomerOpenItem(
        status: StatusType(''),
        amountInTransactionCurrency: 0.0,
        accountingDocument: '',
        postingKeyName: '',
        netDueDate: DateTimeStringValue(''),
        documentReferenceID: '',
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
