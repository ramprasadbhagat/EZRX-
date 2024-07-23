import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_detail.freezed.dart';

@freezed
class InvoiceDetail with _$InvoiceDetail {
  const InvoiceDetail._();

  const factory InvoiceDetail({
    required StringValue invoiceNumber,
    required DateTimeStringValue invoiceDate,
    required double invoiceTotalPrice,
    required int invoiceTotalQty,
    required StatusType invoiceStatus,
    required List<OrderHistoryDetailsOrderItem> orderItems,
  }) = _InvoiceDetail;

  factory InvoiceDetail.empty() => InvoiceDetail(
        invoiceNumber: StringValue(''),
        invoiceDate: DateTimeStringValue(''),
        invoiceStatus: StatusType(''),
        invoiceTotalPrice: 0,
        orderItems: <OrderHistoryDetailsOrderItem>[],
        invoiceTotalQty: 0,
      );
}
