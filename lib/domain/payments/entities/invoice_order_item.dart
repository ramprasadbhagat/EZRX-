import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'invoice_order_item.freezed.dart';

@freezed
class InvoiceOrderItem with _$InvoiceOrderItem {
  factory InvoiceOrderItem({
    required StringValue invoiceId,
    required StringValue orderId,
  }) = _InvoiceOrderItem;

  factory InvoiceOrderItem.empty() => InvoiceOrderItem(
        invoiceId: StringValue(''),
        orderId: StringValue(''),
      );
}

extension PaymentItemListExtension on List<InvoiceOrderItem> {
  Map<String, StringValue> get toMap =>
      {for (final item in this) item.invoiceId.getValue(): item.orderId};
}
