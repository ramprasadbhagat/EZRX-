import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_messages.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_shipping_information.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details.freezed.dart';

@freezed
class OrderHistoryDetails with _$OrderHistoryDetails {
  const OrderHistoryDetails._();
  factory OrderHistoryDetails({
    required OrderHistoryDetailsOrderHeader orderHistoryDetailsOrderHeader,
    required OrderHistoryDetailsShippingInformation
        orderHistoryDetailsShippingInformation,
    required List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItem,
    required OrderHistoryDetailsPaymentTerm orderHistoryDetailsPaymentTerm,
    required String orderHistoryDetailsSpecialInstructions,
    required List<OrderHistoryDetailsPODocuments>
        orderHistoryDetailsPoDocuments,
    required List<OrderHistoryDetailsMessages> orderHistoryDetailsMessages,
  }) = _OrderHistoryDetails;
  factory OrderHistoryDetails.empty() => OrderHistoryDetails(
        orderHistoryDetailsOrderHeader: OrderHistoryDetailsOrderHeader.empty(),
        orderHistoryDetailsShippingInformation:
            OrderHistoryDetailsShippingInformation.empty(),
        orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[],
        orderHistoryDetailsPaymentTerm: OrderHistoryDetailsPaymentTerm.empty(),
        orderHistoryDetailsSpecialInstructions: '',
        orderHistoryDetailsPoDocuments: <OrderHistoryDetailsPODocuments>[],
        orderHistoryDetailsMessages: <OrderHistoryDetailsMessages>[],
      );

  Map<String, String> get getAllPoAsMap => <String, String>{}..addEntries(
      orderHistoryDetailsPoDocuments
          .map((e) => MapEntry(e.name, e.url))
          .toList(),
    );

  bool get poDocumentsAvailable => orderHistoryDetailsPoDocuments.isNotEmpty;

  List<MaterialQueryInfo> get allOrderHistoryDetailsOrderItemQueryInfo =>
      orderHistoryDetailsOrderItem
          .map(
            (item) => item.queryInfo,
          )
          .toList();
}
