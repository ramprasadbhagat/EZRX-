import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_shipping_information_invoices.freezed.dart';

@freezed
class OrderHistoryDetailsShippingInformationInvoices
    with _$OrderHistoryDetailsShippingInformationInvoices {
  const OrderHistoryDetailsShippingInformationInvoices._();
  factory OrderHistoryDetailsShippingInformationInvoices({
    required String invoiceNumber,
    required String invoiceDate,
    required String invoicePrice,
  }) = _OrderHistoryDetailsShippingInformationInvoices;
}
