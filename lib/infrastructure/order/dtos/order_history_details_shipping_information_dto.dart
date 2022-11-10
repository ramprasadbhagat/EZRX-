import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_shipping_information_invoices_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_details_shipping_information.dart';

part 'order_history_details_shipping_information_dto.freezed.dart';
part 'order_history_details_shipping_information_dto.g.dart';

@freezed
class OrderHistoryDetailsShippingInformationDto
    with _$OrderHistoryDetailsShippingInformationDto {
  const OrderHistoryDetailsShippingInformationDto._();
  const factory OrderHistoryDetailsShippingInformationDto({
    @JsonKey(name: 'Address') required String address,
    @JsonKey(name: 'POReference') required String pOReference,
    @JsonKey(name: 'InvoiceNumber') required String invoiceNumber,
    @JsonKey(name: 'InvoiceDate') required String invoiceDate,
    @JsonKey(name: 'PostalCode') required String postalCode,
    @JsonKey(name: 'Country') required String country,
    @JsonKey(name: 'Phone') required String phone,
    @JsonKey(name: 'Fax') required String fax,
    @JsonKey(name: 'Invoices') required List<OrderHistoryDetailsInvoicesDto> invoices,
  }) = _OrderHistoryDetailsShippingInformationDto;
  factory OrderHistoryDetailsShippingInformationDto.fromDomain(
      OrderHistoryDetailsShippingInformation orderHistoryDetailsShippingInformation,) {
    return OrderHistoryDetailsShippingInformationDto(
        address: orderHistoryDetailsShippingInformation.address,
        pOReference: orderHistoryDetailsShippingInformation.pOReference,
        invoiceNumber: orderHistoryDetailsShippingInformation.invoiceNumber,
        invoiceDate: orderHistoryDetailsShippingInformation.invoiceDate,
        postalCode: orderHistoryDetailsShippingInformation.postalCode,
        country: orderHistoryDetailsShippingInformation.country,
        phone: orderHistoryDetailsShippingInformation.phone,
        fax: orderHistoryDetailsShippingInformation.fax,
        invoices: List.from(orderHistoryDetailsShippingInformation.invoices)
          .map((e) => OrderHistoryDetailsInvoicesDto.fromDomain(e),)
          .toList(),
       );
  }

  OrderHistoryDetailsShippingInformation toDomain() {
    return OrderHistoryDetailsShippingInformation(
      address: address,
      pOReference: pOReference,
      invoiceNumber: invoiceNumber,
      invoiceDate: invoiceDate,
      postalCode: postalCode,
      country: country,
      phone: phone,
      fax: fax,
      invoices: invoices.map((e) => e.toDomain()).toList(),
    );
  }

  factory OrderHistoryDetailsShippingInformationDto.fromJson(
          Map<String, dynamic> json,) =>
      _$OrderHistoryDetailsShippingInformationDtoFromJson(json);
}
