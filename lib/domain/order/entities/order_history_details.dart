import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/bonus_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_messages.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_shipping_information.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
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
    required SpecialInstructions orderHistoryDetailsSpecialInstructions,
    required List<PoDocuments> orderHistoryDetailsPoDocuments,
    required List<OrderHistoryDetailsMessages> orderHistoryDetailsMessages,
  }) = _OrderHistoryDetails;
  factory OrderHistoryDetails.empty() => OrderHistoryDetails(
        orderHistoryDetailsOrderHeader: OrderHistoryDetailsOrderHeader.empty(),
        orderHistoryDetailsShippingInformation:
            OrderHistoryDetailsShippingInformation.empty(),
        orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[],
        orderHistoryDetailsPaymentTerm: OrderHistoryDetailsPaymentTerm.empty(),
        orderHistoryDetailsSpecialInstructions: SpecialInstructions(''),
        orderHistoryDetailsPoDocuments: <PoDocuments>[],
        orderHistoryDetailsMessages: <OrderHistoryDetailsMessages>[],
      );

  bool get poDocumentsAvailable => orderHistoryDetailsPoDocuments.isNotEmpty;

  List<MaterialQueryInfo> get allItemQueryInfo => items
      .map(
        (item) => item.orderItem.queryInfo,
      )
      .toList();

  List<OrderHistoryDetailsBonusAggregate> get items {
    final orderHistoryDetailsOrderItemsList =
        <OrderHistoryDetailsBonusAggregate>[];

    for (final items in orderHistoryDetailsOrderItem) {
      if (items.type.isMaterialTypeComm) {
        final orderHistoryDetailsOrderItem = OrderHistoryDetailsBonusAggregate(
          orderItem: items,
          details: items.details,
          tenderContractDetails: items.tenderContractDetails,
          bonusList: <OrderHistoryDetailsOrderItem>[],
        );

        orderHistoryDetailsOrderItemsList.add(orderHistoryDetailsOrderItem);
      } else {
        if (orderHistoryDetailsOrderItemsList.isNotEmpty) {
          orderHistoryDetailsOrderItemsList.last =
              orderHistoryDetailsOrderItemsList.last.copyWith(
            bonusList: List<OrderHistoryDetailsOrderItem>.from(
              orderHistoryDetailsOrderItemsList.last.bonusList,
            )..add(items),
          );
        }
      }
    }

    return orderHistoryDetailsOrderItemsList;
  }

  int get orderItemsCount => orderHistoryDetailsOrderItem.fold<int>(
      0, (previous, current) => previous + current.qty,);

  OrderHistoryDetails copyWithStock({
    required List<MaterialStockInfo> stockInfoList,
    required List<OrderHistoryDetailsOrderItem> orderHistoryDetailsOrderItem,
    required List<PriceAggregate> priceAggregate,
    required SalesOrganisationConfigs salesOrganisationConfigs,
  }) =>
      copyWith(
        orderHistoryDetailsOrderItem: orderHistoryDetailsOrderItem
            .map(
              (e) => e.copyWith(
                materialStockInfo: stockInfoList.firstWhere(
                  (element) => element.materialNumber == e.materialNumber,
                ),
                priceAggregate: priceAggregate
                    .firstWhere(
                      (element) =>
                          element.getMaterialNumber == e.materialNumber,
                    )
                    .copyWith(
                      salesOrgConfig: salesOrganisationConfigs,
                    ),
              ),
            )
            .toList(),
      );
}
