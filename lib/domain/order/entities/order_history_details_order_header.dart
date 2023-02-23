import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_order_header.freezed.dart';

@freezed
class OrderHistoryDetailsOrderHeader with _$OrderHistoryDetailsOrderHeader {
  const OrderHistoryDetailsOrderHeader._();
  factory OrderHistoryDetailsOrderHeader({
    required double totalTax,
    required DateTimeStringValue requestedDeliveryDate,
    required POReference pOReference,
    required String type,
    required PhoneNumber telephoneNumber,
    required double orderValue,
    required DateTimeStringValue createdDate,
    required String eZRXNumber,
    required String orderBy,
    required String referenceNotes,
  }) = _OrderHistoryDetailsOrderHeader;
  factory OrderHistoryDetailsOrderHeader.empty() =>
      OrderHistoryDetailsOrderHeader(
        totalTax: 0.0,
        requestedDeliveryDate: DateTimeStringValue(''),
        pOReference: POReference(''),
        type: '',
        telephoneNumber: PhoneNumber(''),
        orderValue: 0.0,
        createdDate: DateTimeStringValue(''),
        eZRXNumber: '',
        orderBy: '',
        referenceNotes: '',
      );

  double get grandTotal => orderValue + totalTax;
}
