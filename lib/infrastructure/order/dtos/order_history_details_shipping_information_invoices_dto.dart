import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_shipping_information_invoices.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_shipping_information_invoices_dto.freezed.dart';
part 'order_history_details_shipping_information_invoices_dto.g.dart';
@freezed
class OrderHistoryDetailsInvoicesDto with _$OrderHistoryDetailsInvoicesDto {
  const OrderHistoryDetailsInvoicesDto._();
  const factory OrderHistoryDetailsInvoicesDto({
    @JsonKey(name: 'InvoiceNumber',defaultValue: '') required String invoiceNumber,
    @JsonKey(name: 'InvoiceDate',defaultValue: '') required String invoiceDate, 
    @JsonKey(name: 'InvoicePrice',defaultValue: '') required String invoicePrice,

  }) = _OrderHistoryDetailsInvoicesDto;
  factory OrderHistoryDetailsInvoicesDto.fromDomain(OrderHistoryDetailsShippingInformationInvoices invoices) {
    return OrderHistoryDetailsInvoicesDto(
      invoiceNumber: invoices.invoiceNumber,
      invoiceDate: invoices.invoiceDate.dateString,
      invoicePrice: invoices.invoicePrice,
       );
  }

  OrderHistoryDetailsShippingInformationInvoices toDomain() {
    return OrderHistoryDetailsShippingInformationInvoices(
      invoiceNumber:invoiceNumber,
      invoiceDate: DateTimeStringValue(invoiceDate) ,
      invoicePrice: invoicePrice,
    );
  }
 
  factory OrderHistoryDetailsInvoicesDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsInvoicesDtoFromJson(json);
}
