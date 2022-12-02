import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_order_header.freezed.dart';

@freezed
class OrderHistoryDetailsOrderHeader with _$OrderHistoryDetailsOrderHeader {
  const OrderHistoryDetailsOrderHeader._();
  factory OrderHistoryDetailsOrderHeader({
    required double totalTax,
    required String requestedDeliveryDate,
    required String pOReference,
    required String type,
    required String telephoneNumber,
    required double orderValue,
    required String createdDate,
    required String eZRXNumber,
    required String orderBy,
  }) = _OrderHistoryDetailsOrderHeader;
  factory OrderHistoryDetailsOrderHeader.empty() =>
      OrderHistoryDetailsOrderHeader(
        totalTax: 0.0,
        requestedDeliveryDate: '',
        pOReference: '',
        type: '',
        telephoneNumber: '',
        orderValue: 0.0,
        createdDate: '',
        eZRXNumber: '',
        orderBy: '',
      );

  double get grandTotal => orderValue + totalTax;
}
