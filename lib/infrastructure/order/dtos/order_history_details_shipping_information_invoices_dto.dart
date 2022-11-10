import 'package:ezrxmobile/domain/order/entities/order_history_details_shipping_information_invoices.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_shipping_information_invoices_dto.freezed.dart';
part 'order_history_details_shipping_information_invoices_dto.g.dart';
@freezed
class OrderHistoryDetailsInvoicesDto with _$OrderHistoryDetailsInvoicesDto {
  const OrderHistoryDetailsInvoicesDto._();
  const factory OrderHistoryDetailsInvoicesDto({
    @JsonKey(name: 'InvoiceNumber') required String invoiceNumber,
    @JsonKey(name: 'InvoiceDate') required String invoiceDate, 
    @JsonKey(name: 'InvoicePrice') required String invoicePrice,

  }) = _OrderHistoryDetailsInvoicesDto;
  factory OrderHistoryDetailsInvoicesDto.fromDomain(OrderHistoryDetailsShippingInformationInvoices invoices) {
    return OrderHistoryDetailsInvoicesDto(
      invoiceNumber: invoices.invoiceNumber,
      invoiceDate: invoices.invoiceDate,
      invoicePrice: invoices.invoicePrice,
       );
  }

  OrderHistoryDetailsShippingInformationInvoices toDomain() {
    return OrderHistoryDetailsShippingInformationInvoices(
      invoiceNumber:invoiceNumber,
      invoiceDate: invoiceDate,
      invoicePrice: invoicePrice,
    );
  }
 
  factory OrderHistoryDetailsInvoicesDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsInvoicesDtoFromJson(json);
}
