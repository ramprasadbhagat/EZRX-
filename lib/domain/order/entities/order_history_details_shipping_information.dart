import 'package:ezrxmobile/domain/order/entities/order_history_details_shipping_information_invoices.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_shipping_information.freezed.dart';

@freezed
class OrderHistoryDetailsShippingInformation with _$OrderHistoryDetailsShippingInformation{
  const OrderHistoryDetailsShippingInformation._();
  factory OrderHistoryDetailsShippingInformation({
    required String address,
    required POReference pOReference,
    required String invoiceNumber,
    required String invoiceDate,
    required  String postalCode,
    required String country,
    required String phone,
    required String fax,
    required List<OrderHistoryDetailsShippingInformationInvoices> invoices,
  })=_OrderHistoryDetailsShippingInformation;
  factory OrderHistoryDetailsShippingInformation.empty() => OrderHistoryDetailsShippingInformation(
        address: '',
        pOReference: POReference(''),
        invoiceNumber: '',
        invoiceDate: '',
        postalCode: '',
        country: '',
        phone: '',
        fax: '',
        invoices: <OrderHistoryDetailsShippingInformationInvoices>[],
      );
}